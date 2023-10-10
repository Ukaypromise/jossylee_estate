Rails.application.routes.draw do
  get 'order', to: 'order#show'
  post 'order/add'
  post 'order/remove'
  
  resources :properties
  

  devise_for :users
  get "pages/home"
  get "pages/about"

  root "pages#home"
end
