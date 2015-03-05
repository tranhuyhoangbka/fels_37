Rails.application.routes.draw do   
  resources :words do 
    resources :answers  
  end
  resources :relationships, only: [:create, :destroy]
  post 'learned_create' => 'learneds#create'  
  resources :categories, path: :lessions
  # get '/lession/:id' => 'categories#show', as: 'lession'
  
  get 'word_lists' => 'word_lists#index'
  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    resources :followings, :followers
  end
  get 'signup' => 'users#new'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  
  root 'static_pages#home'
end