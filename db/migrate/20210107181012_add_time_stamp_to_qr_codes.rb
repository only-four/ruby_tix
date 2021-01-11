class AddTimeStampToQrCodes < ActiveRecord::Migration[6.0]
  def change_table
    add_column :qr_codes, :created_at, :datetime, null: false
    add_column :qr_codes, :updated_at, :datetime, null: false
  end
end
