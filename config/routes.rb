Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/board" => "homes#board"
  resources :votes
  resources :vote_answers, only: [:create]
  resources :public_relations
  resources :categories, except: [:new, :show]
  resources :topics, except: [:index, :show]
  resources :users, except: [:new, :create]
  patch '/user/change/:id' => 'users#change', as:'change_user'
  resources :groups, except: [:new]
  post "/group_users/add_group" => "group_users#add_group", as: 'add_group'
  post "/group_users/add_user" => "group_users#add_user", as: 'add_user'
  delete "/group_users/:id/destroy_user" => "group_users#destroy_user", as: 'destroy_user'
  delete "/group_users/:id/destroy_group" => "group_users#destroy_group", as: 'destroy_group'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
