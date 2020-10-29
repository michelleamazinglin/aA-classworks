Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # get '/users/:id', to: 'users#show', as: 'user'
  # delete '/users/:id', to: 'users#destroy'

  #auto
  # put '/users/:id', to: 'users#update'
  # get '/users/new', to: 'users#new', as: 'new_user'
  
  #dont need
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  resources :users, only: [:index, :create, :show, :destroy, :update] do
      resources :artworks, only: [:index] #find artwork through user. nested routes
  end
  resources :artworks, only: [:index, :create, :show, :destroy, :update]
  resources :artwork_shares, only: [:create, :destroy]
  
end

