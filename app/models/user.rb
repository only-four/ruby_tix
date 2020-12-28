class User < ApplicationRecord
  has_many :activities, through: :activity_users
  has_many :activity_users
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_rich_text :content



  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
   end




  # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0, 20]
  #   # user.name = auth.info.name
  #   # user.avatar = auth.info.image
  #   # If you are using confirmable and the provider(s) you use validate emails, 
  #   # uncomment the line below to skip the confirmation emails.
  #   # user.skip_confirmation!
  # end
  
end
