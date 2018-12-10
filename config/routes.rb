Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'roles#new'
  resources :roles, only: [:create, :new]
  resources :users, only: [:create, :new,:index]

  get '/hide_roles', to:'roles#hide_role', as: :hide_roles
  match '/update_roles', to: 'roles#update_roles', as: :update_roles,via: [:get,:post]
  post '/create_user',to: 'users#create', as: :create_user
  get '/role_users', to: 'users#user_role', as: :role_users
  match '/user_list', to: 'users#ajax_user', as: :user_list, via: [:get,:post]
  match '/user_filter', to: 'users#user_filter', as: :user_filter, via: [:get,:post]
end
