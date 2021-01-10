class DropCode < ActiveRecord::Migration[6.0]
  def change
    drop_table :qr_codes
  end
end
