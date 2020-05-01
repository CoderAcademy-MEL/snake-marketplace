Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :listings
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
