Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'publications#index'
  resources :publications
  get "/misfotos", to: "publications#misfotos"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
