Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all, as: 'not_found'
  match '/500', to: 'errors#internal_server_error', via: :all, as: 'internal_server_error'

  root 'home#show'
  resources :prompts, only: :show
  get '/feed', to: 'home#show', defaults: { format: 'rss' }

  # API routes
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :random_prompt, only: :index, path: 'prompts/random'
      resources :basecamp_prompt, only: :create, path: 'prompts/basecamp'

      # Admin only routes
      namespace :admin do
        resources :prompts, only: %i[show index]
      end
    end
  end
end
