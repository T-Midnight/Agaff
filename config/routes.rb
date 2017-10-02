Rails.application.routes.draw do
  root  'pages#home'
  match '/projects',    to: 'pages#projects',    via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
