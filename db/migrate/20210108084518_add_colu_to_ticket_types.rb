class AddColuToTicketTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :valid_at, :datetime
    add_column :ticket_types, :expired_at, :datetime
  end
end
