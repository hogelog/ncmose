Rails.application.routes.draw do
  root to: "tops#show"

  resources :novels, only: %i(show create destroy)
end
