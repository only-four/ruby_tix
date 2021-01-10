class RemoveColTicketTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :ticket_types, :expired_at
  end
end
