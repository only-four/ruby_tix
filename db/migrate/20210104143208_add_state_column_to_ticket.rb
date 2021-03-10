class AddStateColumnToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :state, :string
  end
end
