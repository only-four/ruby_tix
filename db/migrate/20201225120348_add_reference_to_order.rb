class AddReferenceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user, foreign_key: true, index: true
  end
end
