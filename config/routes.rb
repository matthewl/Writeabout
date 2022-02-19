Rails.application.routes.draw do
  root 'home#show'
  get '/feed', to: 'feed#index', defaults: { format: 'xml' }

  # API routes
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :random_prompt, only: :index, path: 'prompts/random'
      resources :basecamp_prompt, only: :create, path: 'prompts/basecamp'

      # Admin only routes
      namespace :admin do
        resources :prompts, only: [:show, :index]
      end
    end
  end
end
