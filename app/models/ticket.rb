class Ticket < ApplicationRecord
  has_many :ticket_types
  accepts_nested_attributes_for :ticket_types
end
