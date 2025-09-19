Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :reservations

  resources :tables do
    member do
      patch :release
    end
  end

  root "reservations#new"
end

