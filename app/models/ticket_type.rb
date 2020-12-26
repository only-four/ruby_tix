class TicketType < ApplicationRecord
  belongs_to :activity
  has_many :tickets, , foreign_key: activity_id
end