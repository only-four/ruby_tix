class TicketType < ApplicationRecord
  belongs_to :ticket
  # validates :title, presence: true
end
