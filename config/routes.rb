Rails.application.routes.draw do
  get 'welcome/index'

  root to: 'sessions#new'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :cabinet do
    resource :user, only: [:show]
    resources :temporary_storage_warehouse_transactions, only: [:index, :new, :create, :edit, :update] do
      scope module: :temporary_storage_warehouse_transactions do
        resources :sellings, only: [:new, :create, :edit, :update]
        resources :notifications, only: [:new, :create, :show]
      end
    end
    scope module: :sellings do
      resources :selling_items, only: [:index, :new, :create, :edit, :update, :destroy]
    end

    resources :companies do
      scope module: :companies do
        resources :company_contacts, only: [:new, :create, :edit, :update, :destroy]
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index]
  end
end
