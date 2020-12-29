class RemoveTicketTypeFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :ticket_type, :string
  end
end
