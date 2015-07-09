Rails.application.routes.draw do

  namespace :api, path: '/', defaults: {format: 'json'} do
    namespace :v1 do
      resources :codes, only: :index
      resources :sections, only: :index
    end
  end

end
