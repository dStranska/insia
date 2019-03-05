Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     resources :users, only: [:create, :new]
     resource :sessions, only: [:new, :destroy , :create]


     resources :numbers
     get "/dashboard", to: "dashboard#index", as: :dashboard
     root 'dashboard#index'


end
