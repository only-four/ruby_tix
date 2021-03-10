class AddTicketNumberToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :ticket_number, :string, unique: true
  end
end
