Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   post '/signup', to: 'auth#signup'
   post '/login', to: 'auth#login'

  namespace :api do
    namespace :v1 do

      # ADMIN
      resources :schools, only: [:create, :index]
      resources :school_admins, only: [:create]

      # SCHOOL ADMIN
      resources :courses, only: [:create, :index]
      resources :batches, only: [:create, :index]
      resources :enrollment_requests, only: [] do
        member do
          post :approve
          post :reject
        end
      end

      # STUDENT
      resources :enrollment_requests, only: [:create, :index]
      get 'my_batch/classmates', to: 'students#classmates'
      get 'my_batch/progress', to: 'students#progress'

    end
  end
end
