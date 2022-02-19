class PromptFeed < ApplicationRecord
  LIMIT = 20

  # Pushes a prompt id onto the top of the prompt feed ids.
  def self.push(prompt_id)
    prompt_feed = PromptFeed.first_or_create(created_at: Time.now, updated_at: Time.now)
    prompt_feed.ids.prepend(prompt_id)
    prompt_feed.ids.pop if prompt_feed.ids.count > LIMIT
    prompt_feed.save
  end
end
