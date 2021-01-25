class User < ApplicationRecord
  rolify
  has_many :activity_users
  has_many :activities, through: :activity_users
  has_many :comments
  has_many :orders
  has_many :notices
  has_many :own_activities, class_name: 'Activity'
  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, dependent: :destroy

  has_many :favorites
  has_many :favorite_activities, through: :favorites, source: 'activity'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

   def favorite?(activity)
    favorite_activities.include?(activity)
   end
end
