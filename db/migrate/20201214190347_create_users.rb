class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :account_name
      t.string :email
      t.string :password
      t.boolean :creator
      t.text :favorite_activities
      t.text :joined_order

      t.timestamps
    end
  end
end
