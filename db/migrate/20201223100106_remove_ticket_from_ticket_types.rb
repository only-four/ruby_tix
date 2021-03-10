class RemoveTicketFromTicketTypes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ticket_types, :ticket, null: false, foreign_key: true
  end
end
