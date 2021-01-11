class ChangeColumnTicketsContent < ActiveRecord::Migration[6.0]
  def change
    change_column :ticket_types, :content, :text    
  end
end
