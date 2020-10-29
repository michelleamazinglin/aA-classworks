Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cats
end
#  resources :drops, only: [:index, :create, :show, :destroy, :update, :new, :edit]
