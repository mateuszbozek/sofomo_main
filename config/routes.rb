Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root to: 'alive#index'

  get 'geolocations/index', to: 'geolocations#index'
  get 'geolocations/create', to: 'geolocations#create'
  get 'geolocations/destroy', to: 'geolocations#destroy'

  # Defines the root path route ("/")
  # root "posts#index"
end
