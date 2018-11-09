Rails.application.routes.draw do
#deleting the only params was the first thing I did to have access to all the routes while I build
#then I expanded the actions using 'only:'
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :new, :create, :show, :edit, :update]
  # get '/search', to: 'heroines#search', as: 'heroines_search'
end
