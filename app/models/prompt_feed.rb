class PromptFeed < ApplicationRecord
  LIMIT = 10

  # Return the first prompt feed or create one.
  def self.first_or_generate
    if PromptFeed.count.zero?
      create_prompt_feed
    else
      PromptFeed.first
    end
  end

  # Pushes a prompt id onto the top of the prompt feed ids.
  def self.push(prompt_id)
    prompt_feed = PromptFeed.first_or_generate
    prompt_feed.ids.prepend(prompt_id)
    prompt_feed.ids.pop if prompt_feed.ids.count > LIMIT
    prompt_feed.save
  end

  # Create the initial prompt feed.
  def self.create_prompt_feed
    ids = Prompt.all.pluck(:id)
    ids_length = ids.length
    prompt_feed = PromptFeed.create(created_at: Time.now, updated_at: Time.now)

    LIMIT.times do
      prompt_feed.ids.prepend(ids[rand(0..ids_length)])
    end

    prompt_feed.save

    return prompt_feed
  end

  private_class_method :create_prompt_feed
end
