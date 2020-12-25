class Activity < ApplicationRecord
  has_many :users, through: :activity_users 
  has_many :activity_users
  has_many :comments
  has_many :tickets

  # ticket_type 寫在activity頁面 巢狀表單
  has_many :ticket_types, dependent: :destroy
  accepts_nested_attributes_for :ticket_types, allow_destroy: true

end
