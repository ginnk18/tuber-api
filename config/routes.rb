Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tutors#index'

  resources :tutors
  resources :students
  resources :reviews
  resources :subjects
  resources :users

  root to: 'tutors#index'

end
