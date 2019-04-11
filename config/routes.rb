Rails.application.routes.draw do

  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/edit'
  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end
  
  get "topics/:id/edit" => "topics#edit"

  get 'about' => 'welcome#about'
  get 'blocmarks' => 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
