Rails.application.routes.draw do
  resources :powers, only: %i[index show]
  resources :heroines, only: %i[index show new create]
  get '/search', to: 'heroines#search', as: 'search'
end
