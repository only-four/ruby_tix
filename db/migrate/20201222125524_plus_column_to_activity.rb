class PlusColumnToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :brief, :text
    add_column :activities, :tag, :string
    add_column :activities, :link, :text
    add_column :activities, :form, :string
    add_column :activities, :notice, :text
    add_column :activities, :phone, :string
    add_column :activities, :email, :string
    add_column :activities, :other_contact, :string
    add_column :activities, :limit,:integer, default: 0
    add_column :activities, :ticket_type, :string
    add_column :activities, :quantity, :integer, default: 0
    add_column :activities, :price, :integer, default: 0
    add_column :activities, :total_price, :integer, default: 0

  end
end
