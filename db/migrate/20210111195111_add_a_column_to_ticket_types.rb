class AddAColumnToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :period, :boolean
  end
end
