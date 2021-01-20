class Favorite < ApplicationRecord
  belongs_to :user
  has_many :activity_favorites
  has_many :activities, through: :activity_favorites
end
