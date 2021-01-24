class Activity < ApplicationRecord
  include AASM  
  has_rich_text :content
  has_rich_text :notice
  has_many :activity_users, dependent: :destroy
  has_many :users, through: :activity_users 
  has_many :comments, dependent: :destroy
  # has_many :tickets
  has_many :ticket_types, dependent: :destroy
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  
  validates :hostname, :title, :brief, :begin_datetime, :finish_datetime, :phone, presence: true

  # ticket_type 寫在activity頁面 巢狀表單
  accepts_nested_attributes_for :ticket_types, allow_destroy: true, reject_if: :all_blank
  mount_uploader :image, ImageUploader

  enum is_available: {
    prepare: 1,
    ongoing: 2,
    expired: 3
   }

  #  aasm column: :state do
  #   state :prepare, initial: true
  #   state :ongoing, :expired, :canceled, :deleted

  #   event :ongo do
  #     transitions from: :prepare, to: :ongoing
  #     before do |args|
  #       self.transaction_id = args[:transaction_id]
  #       self.begin_datetime = Time.now
  #     end
  #   end

  #   event :expire do
  #     transitions from: :ongoing, to: :expired
  #   end

  #   event :cancel do
  #     transitions from: :ongoing, to: :canceled
  #   end

  #   event :delete do
  #     transitions from: [:prepare, :expired], to: :deleted
  #   end

  # end   

  

end
