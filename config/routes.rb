Rails.application.routes.draw do
  get '/' => 'home#top'

  post 'likes/:post_id/create' => 'likes#create'
  post "likes/:post_id/destroy" => "likes#destroy"

  get resources :users, except: [:index, :destroy]
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  post 'guest_login' => 'guest_sessions#create'

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
