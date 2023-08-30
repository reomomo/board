Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/board" => "homes#board"
  resources :votes
  resources :vote_answers, only: [:create]
  resources :public_relations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
