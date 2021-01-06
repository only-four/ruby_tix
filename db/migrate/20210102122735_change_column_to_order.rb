class ChangeColumnToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :transaction_id, :string
  end
end