Rails.application.routes.draw do
  resources :users
  get 'signup' => 'users#new'
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'  
end