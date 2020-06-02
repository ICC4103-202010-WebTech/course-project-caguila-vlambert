Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'search', to: "users#search"
  get 'even', to: "events#search"
  get 'evencre', to: "events#searchcreator"
  get 'evenorg', to: "events#searchorg"
  get 'searchorg', to: "organizations#search"
  resources :users do
    resources :invites
    resources :organization_users
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
end
