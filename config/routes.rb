Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'search', to: "users#search"
  get 'even', to: "events#search"
  get 'evencre', to: "events#searchcreator"
  get 'evenorg', to: "events#searchorg"
  get 'searchorg', to: "organizations#search"
  get 'xao_us/:id', to: "users#del", as: 'jiji' 
  get '/admin/organizations', to: "organizations#index"
  post 'admin/organizations', to: "organizations#create"
  get '/admin/organization/:id', to: "organizations#show"
  get 'admin/user/:id' ,to: "users#show"
  post 'admin/users', to: "users#create"
  get '/admin/users', to: "users#index"
  patch '/admin/organizations/:id', to: 'organizations#update'
  patch '/admin/users/:id', to: "users#update"
  delete 'admin/organizations/:id' ,to: "organizations#destroy"
  delete 'admin/users/:id', to: "users#destroy"
  resources :users_admin_plz, :controller => 'users'
  resources :users do
    resources :invites
    resources :organization_users
    resources :messages
    resources :events do
      resources :invites
      resources :hour_proposals
    end
  end
  namespace :api, defaults: {format: :html } do
    namespace :v1 do
      resources :events do
      end
    end
  end
  resources :organizations do
    resources :events do
      resources :invites
    end
  end
  resources :events do 
    resources :comments
    resources :event_files
    resources :images
  
  end
  resources :comments
  resources :images
  resources :event_files
  resources :invites
  resources :hour_proposals
  resources :messages
end
