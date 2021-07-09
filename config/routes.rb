Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit ,:update, :destroy]
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end