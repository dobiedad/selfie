Selfie::Application.routes.draw do
  devise_for :users
  get "index/home"
  root 'index#home'
end
