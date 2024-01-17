Rails.application.routes.draw do
  namespace :auth do
    post 'register', to: 'authentication#register'
    post 'login', to: 'authentication#login'
  end
end
