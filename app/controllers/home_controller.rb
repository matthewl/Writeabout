class HomeController < ApplicationController
  def show
    @prompt = Prompt.random
    @prompts = Prompt.where(id: PromptFeed.first_or_generate.ids)

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end