class Ticket < ApplicationRecord
  has_many :ticket_types, dependent: :destroy
  accepts_nested_attributes_for :ticket_types, allow_destroy: true
end
