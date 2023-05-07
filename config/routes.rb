Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  # Here, get may not be restful. We can use delete instead
  # However, perhaps :delete does not play nicely with r7, doesn't work at this moment
  # delete 'logout', to: 'sessions#destroy', as: 'logout'

  # helper = name -> if we do not use as: ___
  # get 'logout', to: 'sessions#destroy'
  # get 'exit', to: 'sessions#destroy'

  # literal url -> path helper
  # /exit/ -> logout_path
  # get 'exit', to: 'sessions#destroy', as: :logout

  root 'articles#index'
  resources :users
  resources :articles
  resources :sessions
  resources :password_resets
end
