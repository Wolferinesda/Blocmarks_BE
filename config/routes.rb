Rails.application.routes.draw do

  post :incoming, to: 'incoming#create'

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'blocmarks' => 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
