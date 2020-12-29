class RemoveTitleContentPriceQuantityFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :title, :string
    remove_column :tickets, :content, :text
    remove_column :tickets, :quantity, :integer
    remove_column :tickets, :price, :integer
  end
end
