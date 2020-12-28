class Activity < ApplicationRecord
  has_many :users, through: :activity_users 
  has_many :activity_users
  has_many :comments
<<<<<<< HEAD
  has_many :tickets

  # ticket_type 寫在activity頁面 巢狀表單
  has_many :ticket_types, dependent: :destroy
  accepts_nested_attributes_for :ticket_types, allow_destroy: true, reject_if: :all_blank
=======
  accepts_nested_attributes_for :tickets, allow_destroy: true, reject_if: :all_blank
>>>>>>> 64639c83c58488e8be3ca6a3498095773fd993ac

  attr_reader :user_id
end
