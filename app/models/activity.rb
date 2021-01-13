class Activity < ApplicationRecord
  has_rich_text :content
  has_many :activity_users, dependent: :destroy
  has_many :users, through: :activity_users 
  has_many :comments
  # has_many :tickets
  has_many :ticket_types, dependent: :destroy
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :category


  # ticket_type 寫在activity頁面 巢狀表單
  accepts_nested_attributes_for :ticket_types, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader
end
