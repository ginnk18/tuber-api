require 'api_constraints'

Rails.application.routes.draw do

  resources :tutors
  resources :students
  resources :reviews
  resources :subjects


  # This handles routes to api, not needed for this app
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
  #   scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
  #     resources :tutors
  #     resources :students
  #     resources :reviews
  #     resources :subjects
  #   end
  # end

end
