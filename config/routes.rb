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
  post 'voting/:id', to: "hour_proposals#voting", as: 'voting_event'
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
  get 'tos', to: "users#tos"
  get 'tus', to: "users#tus"
  get 'sign_this_user', to: "users#link_sign", as: 'link_sign'
  patch 'sign_u', to: "users#sign", as: 'sign_u'
  get 'report_content/:id', to: "events#report", as: 'report_event'
  get 'report_coment/:id', to: "events#reportcoment", as: 'report_comment'
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
    resources :event_videos
  end
  resources :comments
  resources :images
  resources :event_files
  resources :invites
  resources :hour_proposals
  resources :messages
  resources :event_videos
end
