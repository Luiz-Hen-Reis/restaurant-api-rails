class Api::V1::OrdersController < ApplicationController
  before_action :authorize
  before_action :set_user

  def index
    default_limit = 5

    page = params[:page].to_i.positive? ? params[:page].to_i : 1
    limit = params[:limit].to_i.positive? ? params[:limit].to_i : default_limit

    orders_query = Order.where(user_id: @user.id).order("created_at DESC").page(page).per(limit)

    if orders_query.out_of_range?
      @orders = Order.where(user_id: @user.id).order("created_at DESC").page(orders_query,total_pages).per(default_limit)
    else
      @orders = orders_query
    end
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = @user.id

    if @order.save
      render 'create', status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :payment_cash_return, :order_date,
    order_products_attributes: [:product_id, :quantity])
  end
end
