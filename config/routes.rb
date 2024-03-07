Rails.application.routes.draw do
  get "order", to: "order#show"
  post "order/add"
  post "order/remove"
  post "order/checkout"
  get "order/order_reciept"
  get "order/download"
  get "order/preview"
  resources :properties
  resources :projects

  get "/users/list" => "users#list"
  devise_for :users
  resources :users do
    member do
      delete "delete_user", to: "users#delete_user"
      put "promote_user", to: "users#promote_user"
      get "user_orders", to: "users#user_orders"
    end
  end

  get "pages/home"
  get "pages/about"
  get "pages/team"

  root "pages#home"
end
