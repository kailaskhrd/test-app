Rails.application.routes.draw do

  get 'home/index'
  root to: "home#index"

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  resources :users, only:[:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
