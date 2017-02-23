Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tutors
  resources :students
  resources :reviews
  resources :subjects
  resources :users

  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'

end
