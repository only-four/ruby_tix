class RemoveStateFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :state, :string
  end
end
