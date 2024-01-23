class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @error_message = "Categoria não encontrada."
      render 'error', status: :not_found
    end
  end
end
