class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :seat_number
      t.integer :event
      t.boolean :available

      t.timestamps
    end
  end
end
