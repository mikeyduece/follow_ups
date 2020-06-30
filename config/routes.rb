Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :campaigns do
        resources :conversations, module: :conversations, only: %i[create destroy] do
          resources :messages, module: :messages, only: %i[create destroy]
        end
      end
    end
  end
end
