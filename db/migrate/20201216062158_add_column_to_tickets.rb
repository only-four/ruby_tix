class AddColumnToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :price, :integer
  end
end
