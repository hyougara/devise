Rails.application.routes.draw do
  get 'users/index'
  root to: 'homes#index'
  get 'homes/show',to: 'homes#show'
  devise_for :users , :controllers => {
    :sessions         => 'users/sessions',
    :registrations    => 'users/registrations',
  }
  resources :posts
  resources :users ,only: [:index]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
