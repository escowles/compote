Rails.application.routes.draw do
  devise_for :users
  resources :collections do
    member do
      post :parse
    end
  end
  root "collections#index"
end
