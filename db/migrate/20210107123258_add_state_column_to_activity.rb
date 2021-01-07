class AddStateColumnToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :state, :string
  end
end
