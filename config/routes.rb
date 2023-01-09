# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'employees', to: 'employees#index'
      get 'employees/search', to: 'employees#search'
    end
  end
  root 'root#index'
  get '*path', to: 'root#index', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
