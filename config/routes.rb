Rails.application.routes.draw do

  #devise routes
  #--------------------------------------------------------------------------------------------
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }
  #--------------------------------------------------------------------------------------------

  #app routes
  #--------------------------------------------------------------------------------------------
  resources :users, only: [:show, :update]
  root 'app#index'
  get '/sign_out' => 'app#sign_out', path: '/thankyou-and-come-back-soon!'
  #--------------------------------------------------------------------------------------------

  #reviewer routes
  #--------------------------------------------------------------------------------------------
  authenticate :user, lambda { |u| u.reviewer? || u.admin?} do
    namespace :reviewer do
      resources :categories, only: [:index, :show]
      resources :tags, only: :create do
        collection do
          get '/json_tags' => 'tags#json_tags'
        end
      end
      resources :reviews, except: [:new, :index] do
        member do
          post '/publish' => 'reviews#publish'
        end
        collection do
          get '/youtube_videos' => 'reviews#youtube_videos'
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

  #engines
  #--------------------------------------------------------------------------------------------
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  #--------------------------------------------------------------------------------------------
end