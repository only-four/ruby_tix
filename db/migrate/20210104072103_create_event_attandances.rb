class CreateEventAttandances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attandances do |t|
      t.references :activity, null: false, foreign_key: true
      t.string :ticket_number

      t.timestamps
    end
  end
end
