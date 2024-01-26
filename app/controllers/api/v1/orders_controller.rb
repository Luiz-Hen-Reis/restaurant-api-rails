class Api::V1::OrdersController < ApplicationController
  before_action :authorize
  before_action :set_user

  def index
    @orders = Order.where(user_id: @user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = @user.id

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:orders).permit(:payment_method, :payment_cash_return,
    :delivery_price, :subtotal, :order_date)
  end
end
