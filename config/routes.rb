Rails.application.routes.draw do
  namespace :auth do
    post 'register', to: 'authentication#register'
    post 'login', to: 'authentication#login'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :user_addresses, only: [:index, :create]
    end
  end
end
