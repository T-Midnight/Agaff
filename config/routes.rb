Rails.application.routes.draw do
  root  to: 'pages#index'

  get '/admin' => 'admin/home#index'

  resource :session, only: %i[new create destroy]
end
