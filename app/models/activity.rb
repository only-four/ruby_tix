class Activity < ApplicationRecord
  has_many :users, through: :activity_users 
  has_many :activity_users
  has_many :tickets
  has_many :comments
end
