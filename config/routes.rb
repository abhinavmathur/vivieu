Rails.application.routes.draw do

  #devise routes
  #--------------------------------------------------------------------------------------------
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }
  #--------------------------------------------------------------------------------------------

  #application routes
  #--------------------------------------------------------------------------------------------
  resources :users, only: [:show, :update]
  root 'app#index'
  #--------------------------------------------------------------------------------------------

  #reviewer routes
  #--------------------------------------------------------------------------------------------
  authenticate :user, lambda { |u| u.reviewer? || u.admin?} do
    namespace :reviewer do
      resources :categories, only: [:index, :show]
      resources :tags, only: :create
      resources :reviews, except: :new do
        member do
          post '/publish' => 'reviews#publish'
        end
      end
    end
  end
  #--------------------------------------------------------------------------------------------

  #admin routes
  #--------------------------------------------------------------------------------------------
  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      root 'dashboards#index'
      get '/tags' => 'dashboards#tags'
      get '/manage_tags' => 'dashboards#manage_tags'
      resources :categories
      resources :tags, except: [:show, :new, :index]
      resources :users
    end
  end
  #--------------------------------------------------------------------------------------------
end