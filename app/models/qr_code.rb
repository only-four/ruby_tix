class QrCode < ApplicationRecord
  validates :data, presence: true
end
