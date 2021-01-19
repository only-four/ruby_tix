class AddLocationGuideToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :location_guide, :text
  end
end
