Rails.application.routes.draw do
  devise_for :users
  root 'publications#index'
  resources :publications
  get "/misfotos", to: "publications#misfotos"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
