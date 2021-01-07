class AddStateToTicketType < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :state, :string
  end
end
