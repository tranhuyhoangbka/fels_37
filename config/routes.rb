Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  get 'signup' => 'users#new'
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
end
