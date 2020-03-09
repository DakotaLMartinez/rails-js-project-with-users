Rails.application.routes.draw do
  resources :albums
  get 'welcome/home'
  root 'welcome#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
