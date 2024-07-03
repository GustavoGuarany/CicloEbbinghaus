Rails.application.routes.draw do
  resources :conteudos
  resources :revisoes, only: [:index]
  root "conteudos#index"
end
