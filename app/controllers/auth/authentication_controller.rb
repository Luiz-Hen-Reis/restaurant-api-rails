module Auth
  class AuthenticationController < ApplicationController
    def register
      @user = User.new(user_params)

      if User.exists?(email: @user.email)
        render json: { error: "Já existe um usuário cadastro com este e-mail." },
        status: :unprocessable_entity
      elsif @user.valid?
        @token = encode_token({ user_id: @user.id })
        @user.save
        render 'register', status: :created
      else
        render json: { error: "As senhas não coincidem." },
        status: :unprocessable_entity
      end
    end

    def login
      @user = User.find_by(email: user_params[:email])

      if @user && @user.authenticate(user_params[:password])
        @token = encode_token({ user_id: @user.id })
        render 'login', status: :ok
      else
        render json: { error: "Email ou senha inválidos." },
        status: :unprocessable_entity
      end
    end

    def show
      @user = User.find_by(id: params[:id])

      if @user.present?
        render 'show',
        status: :ok
      else
        render json: { error: "Usuário não existe." },
        status: :unauthorized
      end
    end

    private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
