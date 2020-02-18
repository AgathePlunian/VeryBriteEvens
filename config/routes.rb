Rails.application.routes.draw do
  
  devise_for :views
  root 'events#index'
  devise_for :users
  resources :events 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
