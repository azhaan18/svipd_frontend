Rails.application.routes.draw do
  resources :stories
  root 'stories#index'
  get 'about', to: 'pages#about'
  get 'login', to: 'stories#login'
  get 'home', to: 'stories#index'
  get 'home_login', to: 'stories#home_login'
  get 'stories_paths/:id', to: 'stories#stories_paths'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
