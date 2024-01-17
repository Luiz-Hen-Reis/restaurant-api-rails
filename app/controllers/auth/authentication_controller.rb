module Auth
  class AuthenticationController < ApplicationController
    def register
      @user = User.new(user_params)

      if User.exists?(email: @user.email)
        render 'authentication/register_error',
        status: :unprocessable_entity
      else @user.valid?
        @token = encode_token({ user_id: @user.id })
        @user.save
        render 'authentication/register', status: :ok
      end
    end

    def login
      @user = User.find_by(email: user_params[:email])

      if @user && @user.authenticate(user_params[:password])
        @token = encode_token({ user_id: @user.id })
        render 'authentication/login', status: :ok
      else
        render 'authentication/login_error',
        status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
