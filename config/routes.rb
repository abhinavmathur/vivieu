Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }
  resources :users, only: [:show, :update]
  root 'app#index'
  authenticate :user, lambda { |u| u.reviewer? || u.admin?} do
    namespace :reviewer do
      resources :categories, only: [:index, :show]
      resources :tags, only: :create
    end
  end

  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      root 'dashboards#index'
      resources :categories

    end
  end
end