Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :users do
    resources :comments
    resources :invites
    resources :organization_users
    resources :events do
      resources :invites
    end
  end
  namespace :api, defaults: {format: :html } do
    namespace :v1 do
      resources :events do
        resources :comments
      end
      resources :comments
    end
  end
  resources :organizations do
    resources :events do
      resources :invites
    end
  end
  resources :events do 
    resources :comments
  end
end
