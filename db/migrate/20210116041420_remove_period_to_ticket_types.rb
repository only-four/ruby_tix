class RemovePeriodToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :ticket_types, :period
  end
end
