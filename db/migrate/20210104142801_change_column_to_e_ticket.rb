class ChangeColumnToETicket < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :state, :string
  end
end
