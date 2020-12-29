class AddQuantityToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :quantity, :integer
  end
end
