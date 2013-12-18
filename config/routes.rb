Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :results
    end
  end

  root 'pages#home'
end
