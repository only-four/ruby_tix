class RemoveActivityFromEventAttandance < ActiveRecord::Migration[6.0]
  def change
    remove_reference :event_attandances, :activity, null: false, foreign_key: true
  end
end
