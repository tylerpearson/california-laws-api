Rails.application.routes.draw do

  namespace :api, path: '/', defaults: {format: 'json'} do
    namespace :v1 do
      resources :codes, only: :index
      get '/sections' => 'sections#index'
      get '/sections/:id' => 'sections#show', :constraints => { :id => /[^\/]+/ }
    end
  end

end
