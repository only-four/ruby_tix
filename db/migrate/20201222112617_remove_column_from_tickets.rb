class RemoveColumnFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :begin_datetime, :datetime
    remove_column :tickets, :finish_datetime, :datetime
  end
end
