Tutorial::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#landing'

  get '/tutorials' => 'tutorials#index'
end
