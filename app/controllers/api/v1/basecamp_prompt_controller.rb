module Api
  module V1
    class BasecampPromptController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        @prompt = Prompt.random
        render :prompt, layout: false
      end
    end
  end
end
