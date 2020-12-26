class Ticket < ApplicationRecord
  belongs_to :ticket_types
  belongs_to :orders
  has_many :tickets
end