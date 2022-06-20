Rails.application.routes.draw do
  resources :collections do
    member do
      post :parse
    end
  end
  root "collections#index"
end
