class PromptFeed < ApplicationRecord
  LIMIT = 10

  # Return the first prompt feed or create one.
  def self.first_or_generate
    if PromptFeed.count.zero?
      PromptFeed.create(created_at: Time.now, updated_at: Time.now)
    else
      PromptFeed.first
    end
  end

  # Map the published date to the prompt
  def self.map_dates_to_prompts(prompts)
    prompt_feed = PromptFeed.first_or_generate

    prompts.each do |prompt|
      prompt_feed.ids.each_with_index do |id, index|
        prompt.published_at = prompt_feed.dates[index] if id == prompt.id
      end
    end

    return prompts
  end

  # Pushes a prompt id onto the top of the prompt feed ids.
  def self.push(prompt_id)
    prompt_feed = PromptFeed.first_or_generate

    prompt_feed.ids.prepend(prompt_id)
    prompt_feed.dates.prepend(Time.now)

    prompt_feed.ids.pop if prompt_feed.ids.count > LIMIT
    prompt_feed.dates.pop if prompt_feed.dates.count > LIMIT

    prompt_feed.save
  end
end
