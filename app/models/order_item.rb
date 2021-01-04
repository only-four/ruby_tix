class OrderItem < ApplicationRecord
  belongs_to :order

  # def total_price
  #   ticket_types_id = ticket_types_title
  #   price = TicketType.find(ticket_types_id).price
  #   quantity * price
  # end
end
