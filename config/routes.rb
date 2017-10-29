Rails.application.routes.draw do
  #get 'pages/lizard'
  get 'lizard/:number', to: 'pages#lizard', as: 'lizards', number: /\d+/
  #get 'pages/home'

  #get 'pages', to: 'pages#home', as: '/'
  #get '/', to: 'pages#home', as: 'root'

  get '/about_us', to: 'pages#about', as: 'about'

  #get 'pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
