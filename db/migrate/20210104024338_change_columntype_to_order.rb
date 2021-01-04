class ChangeColumntypeToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :num, :string
  end
end
