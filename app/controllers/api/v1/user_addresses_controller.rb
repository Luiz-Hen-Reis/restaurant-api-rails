class Api::V1::UserAddressesController < ApplicationController
  before_action :authorize
  before_action :set_user

  def index
    @addresses = UserAddress.where(user_id: @user.id)
  end

  def create
    @address = UserAddress.new(address_params)
    @address.user_id = @user.id

    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = authorized_user
  end

  def address_params
    params.require(:user_address).permit(:street, :street_number, :zipcode, :district, :complement)
  end
end
