class AddTicketTypesToTicket < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :ticket_type, foreign_key: true, index: true
  end
end
