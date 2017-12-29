Rails.application.routes.draw do
  root to: "cryptos#index"
  resources :cryptos, only: [:index]
end
