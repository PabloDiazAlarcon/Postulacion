Rails.application.routes.draw do
  resources :venta
  resources :tv_series
  resources :movies
  resources :users
  post "application/delete_venta_movie_from_show"
  post "application/delete_venta_tv_serie_from_show"
  
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
