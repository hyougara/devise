Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users , :controllers => {
    :sessions         => 'users/sessions',
    :registrations    => 'users/registrations',
  }

  resources :posts
  resources :users ,only: [:index, :show, :destroy]

  resources :favorites do
    resources :posts, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
