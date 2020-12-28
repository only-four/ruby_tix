class TicketType < ApplicationRecord
  validates :price, :title, :quantity, presence: true
  
  belongs_to :activity
  has_many :tickets
end