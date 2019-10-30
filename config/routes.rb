Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  post "login" => "users#login"
  resources :users, only: [:show, :edit, :index, :create, :update]
  resources :books
  get '/home/about' => 'books#about', as: 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
