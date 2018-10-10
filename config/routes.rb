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
    resources :temporary_storage_warehouse_transactions, only: [:index, :edit, :update, :new, :create] do
      scope module: :temporary_storage_warehouse_transactions do
        resources :sellings, only: [:index, :edit, :update, :new, :create, :destroy]
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index]
  end
end
