class CreateTicketTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_types do |t|
      t.string :title
      t.text :content
      t.integer :quantity
      t.integer :price
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
