class AddCounterToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :activity_users_count, :integer
  end
end
