Rails.application.routes.draw do
  resources :products
  resources :shops
  resources :product_favorites, only: %i[create destroy]
  resources :shop_favorites, only: %i[create destroy]

  root 'pages#welcome'
  devise_for :sellers, path: 'sellers', controllers: {
    sessions: 'sellers/sessions',
    registrations: 'sellers/registrations'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  devise_scope :seller do
    authenticated :seller do
      namespace :sellers do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
