class AddColumnToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :activity_id, :integer
    remove_column :favorites, :title
  end
end
