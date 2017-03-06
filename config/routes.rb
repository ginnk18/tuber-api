Rails.application.routes.draw do
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

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
