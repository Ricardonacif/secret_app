require 'sidekiq/web'
Rails.application.routes.draw do

  root 'pages#home'
  get 'secret' => 'pages#secret'
  
  devise_for :users, :controllers => {registrations: 'registrations'}
  
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ Rails.application.secrets.secret_pass , Rails.application.secrets.secret_pass ]
  end
  
  resources :questions, only: [:index]
  resources :answers, only: [:create]
  mount Sidekiq::Web => '/sidekiq'
  
end