Rails.application.routes.draw do
  root to: 'home#top'
  get 'about' => 'home#about'

  resources :users, except: [:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get 'search' => 'users#search'
    end
  end
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  post 'guest_login' => 'guest_sessions#create'
  get 'password/reset' => 'password_resets#new'
  post 'password/reset' => 'password_resets#create'
  get 'password/reset/edit' => "password_resets#edit"
  patch 'password/reset/edit' => "password_resets#update"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :posts do
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search' => 'posts#search'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
