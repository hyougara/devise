Rails.application.routes.draw do
  root to: 'posts#index'
  get 'homes/show',to: 'homes#show'
  devise_for :users , :controllers => {
    :sessions         => 'users/sessions',
    :registrations    => 'users/registrations',
  }
  resources :posts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
