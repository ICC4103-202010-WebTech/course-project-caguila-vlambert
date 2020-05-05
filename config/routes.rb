Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :users do
    resources :comments
    resources :organization_users
    resources :events do
      resources :invites
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
