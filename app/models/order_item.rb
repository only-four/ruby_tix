class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # def total_price
  #   ticket_types_id = ticket_types_title
  #   price = TicketType.find(ticket_types_id).price
  #   quantity * price
  # end
end
