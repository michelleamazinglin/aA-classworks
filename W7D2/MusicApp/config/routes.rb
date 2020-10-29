Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/set_cookie', to: 'drops#set_cookie'
  get '/get_cookie', to: 'drops#get_cookie'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
