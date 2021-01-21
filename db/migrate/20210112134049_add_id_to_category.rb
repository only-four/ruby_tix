class AddIdToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :activity_id, :integer
  end
end
