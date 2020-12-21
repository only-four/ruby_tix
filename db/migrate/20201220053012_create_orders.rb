class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :activity_id
      t.integer :user_id
      t.integer :transaction_id
      t.integer :ticket_id
      t.integer :num
      t.integer :price
      t.string :tel
      t.string :address

      t.timestamps
    end
  end
end
