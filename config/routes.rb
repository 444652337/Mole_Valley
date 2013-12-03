Mole::Application.routes.draw do
  get '/sites.html', to: 'page#sites', as: 'sites'
  get '/resources.html', to: 'page#resources', as: 'resources'
  get '/audit.html', to: 'page#audit', as: 'audit'
  get '/contact.html', to: 'page#contact', as: 'contact'
  get '/birds.html', to: 'page#birds', as: 'birds'
  get '/butterflies.html', to: 'page#butterflies', as: 'butterflies'
  get '/fungi.html', to: 'page#fungi', as: 'fungi'
  get '/plants.html', to: 'page#plants', as: 'plants'
  get '/events.html', to: 'page#events', as: 'events'
  get '/organisations.htm', to: 'page#organisations', as: 'organisations'

  root 'page#index' # set root of the site to page page

  namespace :admin do
    get '/' => 'events#index'
    resources :events, except: [:show]
    resources :organisations, except: [:show]
    resource :session, only: [:new, :create, :destroy]
  end
end
