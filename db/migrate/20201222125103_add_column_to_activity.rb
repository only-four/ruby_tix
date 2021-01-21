class AddColumnToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :hostname, :string
  end
end
