Rails.application.routes.draw do
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
      collection do
        get 'expense_category/:id', to: 'transactions#fetch_expense_sub_categories'
      end
    end
  end
end
