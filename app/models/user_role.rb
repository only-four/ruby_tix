class UserRole < ApplicationRecord
  belongs_to :user, :role
end