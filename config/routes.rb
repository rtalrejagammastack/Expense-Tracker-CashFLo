Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  devise_scope :user do
    root 'devise/sessions#new'
    get 'users', to: 'devise/registrations#new'
  end
  resources :home, only: [:index]
  resources :user_categories, param: :slug do
    resources :expense_categories, param: :slug do
      resources :expense_sub_categories, param: :slug, only: %i[new create edit update destroy]
    end
    resources :transactions, param: :slug do
      get 'filter', on: :collection, action: 'index'
      get 'expense_category/:id', on: :collection, action: 'fetch_expense_sub_categories'
    end
  end
  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read
    end
  end

  # put '/notifications/update', to: 'notifications#update'
  # get '/notifications/unread_count', to: 'notifications#unread_count'
  # resources :notifications
  resources :notifications, only: [:index]
end
