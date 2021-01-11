class AddCToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :expire_at, :datetime
  end
end
