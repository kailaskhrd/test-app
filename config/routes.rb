Rails.application.routes.draw do

  get 'home/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  resources :users, except:[:show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    root to: "devise/registrations#edit"
  end
end
