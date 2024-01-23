class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all.order("name ASC")
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
