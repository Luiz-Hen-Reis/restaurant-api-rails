Rails.application.routes.draw do
  post 'auth/register', to: 'authentication#register'
end
