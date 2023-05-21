Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :create, :destroy]
  resources :posts, only: [:index, :show, :create, :destroy]
  resources :comments, only: [:index, :show, :create, :destroy]
  resources :likes, only: [:index, :show, :create, :destroy]
  post '/login', to: 'authentication#login'

end
