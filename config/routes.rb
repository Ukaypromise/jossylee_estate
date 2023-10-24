Rails.application.routes.draw do
  get 'order', to: 'order#show'
  post 'order/add'
  post 'order/remove'
  post 'order/checkout'
  get 'order/order_reciept'
  resources :properties
  

  devise_for :users
  get "pages/home"
  get "pages/about"

  root "pages#home"
end
