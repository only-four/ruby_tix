class RemoveBfdatetimeFromTicketTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :ticket_types, :begin_date, :datetime
    remove_column :ticket_types, :finish_date, :datetime
  end
end
