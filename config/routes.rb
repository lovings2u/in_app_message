Rails.application.routes.draw do
  get '/messages/:act' => 'message#index', as: 'messages'
  get 'message/new', as: 'new_message'
  post 'message/deliver', as: 'send_message'
  get '/message/:id' => 'message#show', as: 'message'
  delete 'message/:id' => 'message#destroy', as: 'destroy_message'
  devise_for :users
  resources :homes
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
