class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :content, presence: true
end
