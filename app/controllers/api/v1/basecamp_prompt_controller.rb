module Api
  module V1
    class BasecampPromptController < ApplicationController
      def index
        @prompt = Prompt.random
        render layout: false
      end
    end
  end
end
