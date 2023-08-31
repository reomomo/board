Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/edit'
  devise_for :users
  root to: "homes#top"
  get "/board" => "homes#board"
  resources :votes
  resources :vote_answers, only: [:create]
  resources :public_relations
  resources :participants, only: [:new, :create, :edit, :update]
  resources :categories, only: [:create, :index, :edit, :update, :destroy]
  resources :topics, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  patch '/user/change/:id' => 'users#change', as:'change_user'
  resources :groups, except: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
