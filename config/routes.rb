Tutorial::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#landing'

  get '/tutorials' => 'tutorials#index'

  get '/admin' => 'admin/tutorials#index'
  namespace 'admin' do
  	#get '/' => 'tutorials#index'
  	#root to: 'tutorials#index'
  	resources :subjects, path: 'tutorials', controller: 'tutorials' do
  		resources :pages
  	end
  end
  #get '/admin' => 'managements#index'
  #get '/admin/tutorials/new' => 'managements#new'
end
