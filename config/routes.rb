Rails.application.routes.draw do
  devise_for :users
  root to: 'welcomes#show'
  resource :welcomes

  get '/change_password', to: 'usersettings#change_password'
  get '/change_username', to: 'usersettings#change_username'
  patch '/change_username/:id', to: 'usersettings#update_username', as: :update_username
  patch '/change_password/:id', to: 'usersettings#update_password', as: :update_password
  # resources :change_username, only: [:update_username, :change_username]
  # resources :usersettings

  resources :editors
  get '/newPage', to: 'editors#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
