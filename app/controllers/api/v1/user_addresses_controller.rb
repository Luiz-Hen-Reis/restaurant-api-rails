class Api::V1::UserAddressesController < ApplicationController
  def index
    @addresses = UserAddress.all
  end
end
