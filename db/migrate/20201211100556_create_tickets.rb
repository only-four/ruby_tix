class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :location
      t.datetime :date
      t.integer :total_price
      t.string :ticket_type
      t.string :notice
      t.string :qr_code

      t.timestamps
    end
  end
end
