Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/board" => "homes#board"
  resources :votes
  resources :vote_answers, only: [:create]
  resources :public_relations
  resources :categories, except: [:new, :show]
  resources :topics, except: [:index, :show]
  resources :users, except: [:new, :create, :destroy]
  # 掲示物作成画面での参加・不参加の変更時の処理
  patch '/user/change/:id' => 'users#change', as:'change_user'
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 退会の論理削除
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :groups, except: [:new]
  post "/group_users/add_group" => "group_users#add_group", as: 'add_group'
  post "/group_users/add_user" => "group_users#add_user", as: 'add_user'
  delete "/group_users/:id/destroy_user" => "group_users#destroy_user", as: 'destroy_user'
  delete "/group_users/:id/destroy_group" => "group_users#destroy_group", as: 'destroy_group'
  resources :major_items, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
