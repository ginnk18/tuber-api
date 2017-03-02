Rails.application.routes.draw do
  resources :agents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tutors
  resources :students
  resources :reviews
  resources :subjects
  resources :users

  root to: 'tutors#index'

  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'

  get 'tutors/search/:search_term' => 'tutors#search'

end
