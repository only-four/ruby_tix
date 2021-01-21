class AddEventToQrcode < ActiveRecord::Migration[6.0]
  def change
    add_column :qr_codes, :event, :integer
  end
end
