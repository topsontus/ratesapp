Rails.application.routes.draw do
  root to: 'rates#index'

  devise_for :user

  get 'admin', to: 'admin/rates#index'

  namespace :admin do
    resources :rates, only: %i[create]
  end
end
