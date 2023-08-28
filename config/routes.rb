Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/board" => "homes#board"
  resources :votes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
