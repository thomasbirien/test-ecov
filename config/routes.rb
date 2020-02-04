Rails.application.routes.draw do

  resources :rides, only: :create
  post "rides/start", to: "rides#start"
  post "rides/cancel", to: "rides#start"
end
