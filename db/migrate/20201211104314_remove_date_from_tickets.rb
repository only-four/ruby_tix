class RemoveDateFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :date, :datetime
  end
end
