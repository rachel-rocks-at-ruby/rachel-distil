Rails.application.routes.draw do

  root to: 'accounts#index'

  resources :accounts, :domains
end
