class FeedController < ApplicationController
  def index
    @prompts = Prompt.where(id: PromptFeed.first_or_generate.ids)
  end
end