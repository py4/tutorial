Tutorial::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#landing'

  get '/tutorials' => 'tutorials#index'
  #get '/admin' => 'admin/tutorials#index'

  resources :subjects, path: 'tutorials', controller: 'tutorials', only: [:index, :show] do
    resources :pages, only: [:index, :show] do
      post '/learn' => 'pages#learn'
    end
  end

  namespace 'admin' do
    root to: 'tutorials#index'
    resources :subjects, path: 'tutorials', controller: 'tutorials' do
      resources :pages
    end
  end
end
