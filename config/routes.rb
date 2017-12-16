Rails.application.routes.draw do
  root  to: 'pages#index'

  resource :session, only: %i[new create destroy]
end
