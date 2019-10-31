Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'welcome#show'
  #get 'users/:index', to: 'welcome#user', as: 'user_page'
  root 'gossips#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/gossip/:index', to: 'welcome#gossip', as: 'gossip_page'
  # New routes to create gossips
  resources :gossips do
    resources :comments
  end
  resources :cities
  resources :users
end
