module Api
  module V1
    class RandomPromptController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: Prompt.random.slice(:prompt, :full_prompt)
      end
    end
  end
end
