class AddDateToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :sell_start, :datetime
    add_column :ticket_types, :sell_deadline, :datetime
  end
end
