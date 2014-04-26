Rails.application.routes.draw do
  
  get 'maps/show'

  root to: "tools#index"
  devise_for :users
  resources :tools
    resources :charges
    resource :map
    resources :comments
end
