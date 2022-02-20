namespace :app do
  desc 'Push next random prompt to feed'
  task update_feed: :environment do
    PromptFeed.push(Prompt.random.id)
  end

  desc 'Populate the public id for all prompts without a public id'
  task populate_prompt_public_ids: :environment do
    Prompt.where(public_id: nil).each do |prompt|
      next if prompt.public_id.present?

      prompt.regenerate_public_id
      prompt.save
    end
  end
end
