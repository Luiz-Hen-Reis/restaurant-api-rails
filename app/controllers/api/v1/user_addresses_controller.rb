class Api::V1::UserAddressesController < ApplicationController
  before_action :authorize

  def index
    @addresses = UserAddress.all
  end
end
