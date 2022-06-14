class AdminController < ApplicationController
  def index
    @account = current_account
    @active_sessions = @account.active_sessions.order(created_at: :desc)
    @prompts = Prompt.where(id: PromptFeed.first_or_generate.ids)
    @prompts = PromptFeed.map_dates_to_prompts(@prompts)
  end
end