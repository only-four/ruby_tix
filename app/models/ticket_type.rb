class TicketType < ApplicationRecord
  has_rich_text :content
  validates :price, :title, :quantity, presence: true
  
  belongs_to :activity
  has_many :tickets
end