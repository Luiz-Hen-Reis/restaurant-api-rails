class Api::V1::ProductsController < ApplicationController
  def index
    default_limit = 8

    page = params[:page].to_i.positive? ? params[:page].to_i : 1
    limit = params[:limit].to_i.positive? ? params[:limit].to_i : default_limit

    products_query = Product.order(name: :asc).page(page).per(limit)

    if products_query.out_of_range?
      @products = Product.order(name: :asc).page(products_query.total_pages).per(default_limit)
    else
      @products = products_query
    end
  end

  def show
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @error_message = "Produto não encontrado."
      render 'error', status: :not_found
    end
  end
end
