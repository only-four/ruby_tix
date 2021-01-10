class User < ApplicationRecord
  has_many :activities, through: :activity_users
  has_many :activity_users
  has_many :comments
  has_many :orders
  has_many :rolify
  has_many :own_activities, class_name: 'Activity'
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
   end
end
