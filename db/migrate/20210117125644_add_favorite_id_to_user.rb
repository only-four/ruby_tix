class AddFavoriteIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorite_id, :integer
  end
end
