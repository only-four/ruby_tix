class RemoveTicketsRefFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :activity_id, :integer
    remove_column :orders, :ticket_id, :integer
    remove_column :orders, :user_id, :integer
  end
end
