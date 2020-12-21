class AddStateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :state, :string
  end
end
