Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "home#index"

  resource :user, only: %i[create edit update destroy]
  resources :users, only: %i[index create show]

  namespace :patients do
    resources :appointments, only: %i[index new create destroy]
    resources :index, path: '', only: [] do
      get 'dashboard', on: :member
      get 'doctors_list', on: :collection
      get 'index', on: :collection
    end
  end

  namespace :doctors do
    resources :appointments, only: %i[index]
  end

  get "/pages/:page" => "pages#show", as: :page
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#internal_server_error', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
