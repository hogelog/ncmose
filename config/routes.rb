Rails.application.routes.draw do
  root to: "tops#show"

  resources :novels, only: %i(index show create destroy)
end
