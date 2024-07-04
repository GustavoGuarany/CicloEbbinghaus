Rails.application.routes.draw do
  devise_for :users
  resources :conteudos
  resources :agenda_revisoes, only: [:index]
  root "conteudos#index"
end
