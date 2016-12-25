Rails.application.routes.draw do

  root             'welcome#index'
  get 'about'   => 'welcome#about'
  get 'support' => 'welcome#support'

  resources :cards
end
