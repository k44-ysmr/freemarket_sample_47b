Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations:      'users/registrations',
      sessions:      'users/sessions'
    }


  root to: 'items#index'
  resources :users do
    get 'profile'
  end
  resources :items
  resources :buys
  resources :credit_card

  resources :identifications, only: [:index]
  resources :logouts, only: [:index]

end
