class TicketType < ApplicationRecord
  belongs_to :activity
  has_many :tickets
end