class Activity < ApplicationRecord
  has_many :users, through: :activity_users 
  has_many :activity_users, dependent: :destroy
  has_many :comments
  has_many :tickets
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  # ticket_type 寫在activity頁面 巢狀表單
  has_many :ticket_types, dependent: :destroy
  accepts_nested_attributes_for :ticket_types, allow_destroy: true, reject_if: :all_blank

end
