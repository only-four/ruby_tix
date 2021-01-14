class AddACounterToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :activity, :string
    add_column :activities, :attend_in, :datetime
  end
end
