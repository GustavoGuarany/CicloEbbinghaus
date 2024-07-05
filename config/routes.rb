Rails.application.routes.draw do
  devise_for :users
  resources :conteudos
  resources :agenda_revisoes, only: [:index]
  resources :revisoes, only: [:index, :update]
  root "conteudos#index"
end
