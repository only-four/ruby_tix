class Activity < ApplicationRecord
  has_many :users, through: :activity_users 
  has_many :activity_users
  has_many :tickets
  has_many :comments
  accepts_nested_attributes_for :tickets, allow_destroy: true, reject_if: :all_blank

  attr_reader :user_id
end
