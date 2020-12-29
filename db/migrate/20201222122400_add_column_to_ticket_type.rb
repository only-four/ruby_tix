class AddColumnToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :ticket_types, :activity, foreign_key: true
  end
end
