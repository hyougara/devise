Rails.application.routes.draw do
  root to: 'posts#index'
 
  devise_for :users , :controllers => {
    :sessions         => 'users/sessions',
    :registrations    => 'users/registrations',
  }
  resources :posts
  resources :users ,only: [:index, :show, :destroy]
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
