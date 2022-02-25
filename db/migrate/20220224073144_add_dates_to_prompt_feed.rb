class AddDatesToPromptFeed < ActiveRecord::Migration[7.0]
  def change
    add_column :prompt_feeds, :dates, :datetime, array: true, default: []
  end
end
