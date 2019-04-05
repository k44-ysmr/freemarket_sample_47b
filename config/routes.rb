Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations:      'users/registrations',
      sessions:      'users/sessions'
    }

  root to: 'items#index'
  resources :users
  resources :items
  resources :buys
  resources :credit_card
end
