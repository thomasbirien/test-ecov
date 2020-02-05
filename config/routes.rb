Rails.application.routes.draw do
  root to: "rides#index"
  resources :rides, only: :create
  patch "rides/start", to: "rides#start"
  patch "rides/cancel", to: "rides#start"
end
