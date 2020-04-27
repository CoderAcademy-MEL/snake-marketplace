Rails.application.routes.draw do
  root to: "pages#home"
  resources :listings
  get "*path", to: "pages#not_found"
end
