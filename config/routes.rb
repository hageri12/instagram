Rails.application.routes.draw do

  get 'slot' => 'slot#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'blogs#index'
  resources :blogs, only:[:index,:new,:create,:edit,:update,:destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
     registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
