Rails.application.routes.draw do
  get 'tops/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'users#show'
  resources :users, only: [:show]
  resources :health_statuses
  resources :steps
  resources :insurances, only: [:index,:show] do
    collection do
      post 'recursion'
      post 'registration'
    end
  end
  resources :checkups, only: :show do
    collection do
      get 'search'
      get 'results'
    end
  end
  resources :fitnesses, only: :show do
    collection do
      get 'search'
      get 'results'
    end
  end

  resources :tops, only: [:index]

end
