class ChangeColumnCreator < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :creator, 'boolean USING CAST(creator AS boolean)'
  end
end
