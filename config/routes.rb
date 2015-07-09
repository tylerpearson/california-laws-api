Rails.application.routes.draw do

  resources :codes, only: :index, defaults: { format: 'json' }

end
