Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :admins,
      skip: [:registrations],
      controllers: {sessions: 'admins/sessions'},
      path: '',
      path_names: {sign_in: 'sign_in', sign_out: 'sign_out'}

    namespace :admin, path: '' do
      root to: 'home#index'
      resources :admins
      resources :users
      resources :books
      resources :reservations
    end
  end

  constraints subdomain: '' do
    devise_for :users, controllers: {registrations: 'users/registrations'}

    namespace :user do
      resources :books, only: [:index, :show]
      resources :reservations
    end

    root to: 'user/home#index'
  end
end
