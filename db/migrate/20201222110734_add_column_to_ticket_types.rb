class AddColumnToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :begin_date, :datetime
    add_column :ticket_types, :finish_date, :datetime
  end
end
