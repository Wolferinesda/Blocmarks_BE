Rails.application.routes.draw do

  devise_for :users

  resources :topics
  get "topics/:id/edit" => "topics#edit"

  get 'about' => 'welcome#about'
  get 'blocmarks' => 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
