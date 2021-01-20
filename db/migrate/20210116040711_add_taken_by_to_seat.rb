class AddTakenByToSeat < ActiveRecord::Migration[6.0]
  def change
    add_column :seats, :taken_by, :integer
  end
end
