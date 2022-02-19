class AddPromptFeed < ActiveRecord::Migration[7.0]
  def change
    create_table :prompt_feeds do |t|
      t.integer :ids, array: true, default: []
      t.timestamps
    end
  end
end
