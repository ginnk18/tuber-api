Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  get 'conversations/index'

  get 'conversations/show'

  get 'message/create'

  post 'message/sms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tutors do
    resources :reviews, only: [:create, :destroy, :update]
  end
  
  resources :students
  resources :subjects
  resources :users

  root to: 'tutors#index'

  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'

  #get 'tutors/search/' => 'tutors#search'
  get 'search/' => 'search#index'
end
