class AddReferenceToNotices < ActiveRecord::Migration[6.0]
  def change
    add_reference :notices, :user, null: false, foreign_key: true
  end
end
