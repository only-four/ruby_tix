class CreateActivityFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_favorites do |t|
      t.integer "activity_id"
      t.integer "favorite_id"

      t.timestamps
    end
  end
end
