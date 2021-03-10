class AddCategoryIdToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :category_id, :integer
    remove_column :categories, :activity_id
  end
end
