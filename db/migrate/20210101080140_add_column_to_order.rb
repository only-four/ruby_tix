class AddColumnToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :participant, :string
    add_column :orders, :paid_at, :datetime
    add_column :orders, :quantity, :integer
  end
end