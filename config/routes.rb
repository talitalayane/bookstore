Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}

  namespace :admin do
    root to: "home#index"
    resources :admins
    resources :users
    resources :books
    resources :reservations
  end

    root to: "user/home#index"

  namespace :user do
    resources :books, only: [:index, :show]
    resources :reservations
  end
end
