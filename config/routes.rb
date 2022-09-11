Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}

  namespace :admin do
    root to: "home#index"
    resources :admins
    resources :users, only: :index
  end

    root to: "user/home#index"

  namespace :user do

  end
end
