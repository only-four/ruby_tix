class AddrefToEventAttandance < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_attandances, :ticket, foreign_key: true, index: true
  end
end
