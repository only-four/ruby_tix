class TicketType < ApplicationRecord
  validates :price, :title, :quantity, :sell_start, :sell_deadline, presence: true
  
  belongs_to :activity
  has_many :tickets
end