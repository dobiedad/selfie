Selfie::Application.routes.draw do
  devise_for :users
  get "index/home"
  root 'index#home'

  resources :user_selfies

  #post 'user_selfies' => 'user_selfies'

end
