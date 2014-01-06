Rails.application.routes.draw do
  namespace :api do
    api_version(1) do
      resources :results
    end
  end

  resources :runners do
    resources :results
  end

  root 'pages#home'
end
