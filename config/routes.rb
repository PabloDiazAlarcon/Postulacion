Rails.application.routes.draw do
  resources :venta
  resources :tv_series
  resources :movies
  resources :users
  
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
