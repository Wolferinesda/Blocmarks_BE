Rails.application.routes.draw do

  get 'users/show'
  get 'likes/index'
  post :incoming, to: 'incoming#create'

  devise_for :users
  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:index, :create, :destroy]
  end

  get 'about' => 'welcome#about'
  get 'blocmarks' => 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
