Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "home#index"

  resource :user, only: %i[create edit update destroy]
  resources :users, only: %i[index create show]

  # resource :doctors, only: [:index, :show] do
  #   index :index, only: [:new, :create, :show]
  # end

  # namespace :users do
  #   resources :doctors, only: [:new, :index, :create, :show] do
  #     get 'index', on: :collection
  #     #index :index, only: [:new, :index, :create, :show]
  #   end
    namespace :patients do
      resources :appointments
      resources :index, path: '', only: [] do
        get 'dashboard', on: :member
        get 'doctors_list', on: :collection
        get 'index', on: :collection
      end
    end

  namespace :doctors do
    resources :appointments
  end

  get "/pages/:page" => "pages#show", as: :page

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#internal_server_error', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
