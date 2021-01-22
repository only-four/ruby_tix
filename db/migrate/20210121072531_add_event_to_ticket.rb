class AddEventToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :event, :integer
  end
end
