Rails.application.routes.draw do
  
  root to: "tools#index"
  devise_for :users
  resources :tools
    resources :charges
end
