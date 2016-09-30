Rails.application.routes.draw do
  resources :users
  # catbook.com/api/v1/cats
  namespace :api do 
    namespace :v1 do 
      resources :cats
      resources :hobbies
      post '/login', to: "sessions#create"
    end
  end
end
