class AddPublicIdToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :public_id, :string
  end
end
