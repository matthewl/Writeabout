module Api
  module V1
    module Admin
      class PromptsController < ApplicationController
        before_action :authenticate

        def index
          prompts = Prompt.search(params[:query]).map do |p|
            p.slice(:id, :prompt, :full_prompt)
          end

          render json: prompts
        end

        private

        def authenticate
          authenticate_or_request_with_http_token do |token, _options|
            token == ENV['API_KEY']
          end
        end
      end
    end
  end
end
