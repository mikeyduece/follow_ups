Rails.application.routes.draw do
  namespace :campaigns do
    resource :follow_ups, only: :create
  end
end
