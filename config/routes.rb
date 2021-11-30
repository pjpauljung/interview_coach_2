Rails.application.routes.draw do
  resources :question_sessions
  resources :question_assessments
  resources :questions
  resources :votes
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
