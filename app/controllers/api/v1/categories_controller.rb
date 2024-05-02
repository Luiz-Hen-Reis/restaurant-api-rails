require 'aws-sdk-s3'

class Api::V1::CategoriesController < ApplicationController
  def index
    cache_key = 'categories'

    cached_data, cached_time = s3_cache_read(cache_key)

    if cached_data.nil? || cache_expired?(cached_time)
      @categories = Category.all.order(name: :asc)
      categories_data = @categories.map { |category| { id: category.id, name: category.name } }
      s3_cache_write(cache_key, categories_data)
    else
      @categories = cached_data.map { |category_data| Category.new(category_data) }
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @error_message = "Categoria não encontrada."
      render 'error', status: :not_found
    end
  end

  private

  def s3_cache_read(key)
    s3 = Aws::S3::Client.new(
      region: Rails.application.credentials.dig(:aws, :s3_cache_bucket_region),
      credentials: Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
    )

    begin
      response = s3.get_object(bucket: Rails.application.credentials.dig(:aws, :s3_cache_bucket), key: key)
      cached_time = response.last_modified
      cached_data = JSON.parse(response.body.read)
      [cached_data, cached_time]
    rescue Aws::S3::Errors::NoSuchKey
      [nil, nil]
    end
  end

  def s3_cache_write(key, data)
    s3 = Aws::S3::Client.new(
      region: Rails.application.credentials.dig(:aws, :s3_cache_bucket_region),
      credentials: Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
    )
    s3.put_object(bucket: Rails.application.credentials.dig(:aws, :s3_cache_bucket), key: key, body: data.to_json)
  end

  def cache_expired?(cached_time)
    return true if cached_time.nil?

    current_time = Time.now
    time_difference = current_time - cached_time
    time_difference > 3600
  end
end
