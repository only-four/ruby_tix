class CreateActivityUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
