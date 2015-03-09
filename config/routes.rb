Selfie::Application.routes.draw do
  get "index/home"
  root 'index#home'

  resources :user_selfies
  devise_for :users, :controllers => {sessions: 'sessions'}
  #post 'user_selfies' => 'user_selfies'

end
