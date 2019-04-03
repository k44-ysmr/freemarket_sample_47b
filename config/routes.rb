Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations:      'users/registrations',
      sessions:      'users/sessions'
    }

  root to: 'items#index'
  resources :users do
    get 'logout'
  end
  resources :items
  resources :buys
end
