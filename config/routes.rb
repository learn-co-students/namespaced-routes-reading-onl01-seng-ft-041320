Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  
  #show on localhost
  root 'posts#index'

  #get '/admin/stats', to: 'stats#index'
  #scope allows us to group a block of routes with one prefix
  #scope '/admin', module: 'admin' do
    #resources :stats, only: [:index]
  #end

  namespace :admin do
    resources :stats, only: [:index]
  end
end
