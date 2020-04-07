Rails.application.routes.draw do
  devise_for :users
  resources :candidates
  resources :trails do
    post :vote, on: :member
  end
  resources :awards
  root 'candidates#index'
end
