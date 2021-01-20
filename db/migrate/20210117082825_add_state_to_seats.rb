class AddStateToSeats < ActiveRecord::Migration[6.0]
  def change
    add_column :seats, :state, :string
  end
end
