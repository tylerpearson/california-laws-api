Rails.application.routes.draw do

  resources :codes, only: :index, defaults: { format: 'json' }
  resources :sections, only: :index, defaults: { format: 'json' }

end
