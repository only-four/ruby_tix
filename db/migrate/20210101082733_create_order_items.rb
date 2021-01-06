class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.string :activities_title
      t.string :ticket_types_title
      t.integer :quantity

      t.timestamps
    end
  end
end
