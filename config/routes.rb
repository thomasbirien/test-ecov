Rails.application.routes.draw do

  resources :rides, only: [:index, :create]
  patch "rides/start", to: "rides#start"
  patch "rides/cancel", to: "rides#start"
end
