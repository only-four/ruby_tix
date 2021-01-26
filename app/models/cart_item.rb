class CartItem
  attr_accessor :ticket_type_id, :quantity

  def initialize(ticket_type_id, quantity = 1)
    @ticket_type_id = ticket_type_id
    @quantity = quantity
  end

  def increment(n = 1)
    @quantity += n
  end

  def ticket_type
    TicketType.find_by(id: ticket_type_id)
  end

  def price
    ticket_type.price * quantity
  end
end