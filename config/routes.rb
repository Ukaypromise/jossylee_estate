Rails.application.routes.draw do
  resources :properties
  resources :cart do
    collection do
      post "add_to_cart", to: "cart#add_to_cart", as: "add_to_cart"
      get "view_cart"
      delete "remove_from_cart"
    end
  end
  devise_for :users
  get "pages/home"
  get "pages/about"

  root "pages#home"
end
