Rails.application.routes.draw do
  root to: 'posts#index'
  # get 'homes/show',to: 'homes#show'
  # get 'homes',to: 'homes#index'
  devise_for :users , :controllers => {
    :sessions         => 'users/sessions',
    :registrations    => 'users/registrations',
  }
  # progateの書き方 あとで書き直す
  post "favorites/:post_id/create" => "favorites#create"
  post "favorites/:post_id/destroy" => "favorites#destroy"

  resources :posts
  resources :users ,only: [:index, :show, :destroy]

  # resources :posts do
    resources :favorite, only: [:create, :destroy]
  # end
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# admin用のpageを作成する /admin/usersというルートが作成される
# admin/users用の新しいコントロールが必要になる
  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
