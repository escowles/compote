Rails.application.routes.draw do
  resources :collections
  root "collections#index"
end
