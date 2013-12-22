Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :results
    end
  end

  get "display_graph", to: "graphs#display", as: :display_graph

  root 'pages#home'
end
