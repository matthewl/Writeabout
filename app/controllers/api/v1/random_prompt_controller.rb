module Api
  module V1
    class RandomPromptController < ApplicationController
      def index
        render json: Prompt.random.slice(:prompt, :full_prompt)
      end
    end
  end
end
