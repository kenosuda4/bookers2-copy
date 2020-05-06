Rails.application.routes.draw do

  root 'homes#top'
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update, :index]
  resources :books

  get "about" => "homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
