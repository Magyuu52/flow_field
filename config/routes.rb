Rails.application.routes.draw do
  get 'posts/index'
  get '/' => 'home#top'

  get resources :users, except: [:index, :destroy]
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  post 'guest_login' => 'guest_sessions#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
