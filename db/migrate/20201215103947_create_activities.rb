class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.boolean :is_available
      t.datetime :begin_datetime
      t.datetime :finish_datetime
      t.string :location
      t.boolean :buy

      t.timestamps
    end
  end
end
