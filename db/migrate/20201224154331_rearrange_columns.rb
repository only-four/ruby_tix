class RearrangeColumns < ActiveRecord::Migration[6.0]
  def up
    change_column :ticket_types, :content, :string, after: :sell_deadline
  end
end
