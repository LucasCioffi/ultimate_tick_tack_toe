Rails.application.routes.draw do
  get '/status' => 'status#index'

  namespace :api do
    namespace :v1 do
      resources :games
      post '/move' => 'games#update'
    end
  end
end
