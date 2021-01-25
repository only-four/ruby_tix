class ActivityFavorite < ApplicationRecord
  belongs_to :favorite
  belongs_to :activity
end
