class AddBeginAndFinishDatetimeToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :begin_datetime, :datetime
    add_column :tickets, :finish_datetime, :datetime
  end
end
