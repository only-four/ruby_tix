class AddReferencesToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :order, foreign_key: true, index: true
  end
end
