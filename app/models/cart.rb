class Cart < CartsController
  SessionKey = :cart7749
  attr_accessor :items, :cart_quantity
  
  def initialize(items = [])
    @items = items
  end

  def add_item(ticket_type_id, cart_quantity)
    found_item = items.find { |item| item.ticket_type_id == ticket_type_id }
    cart_quantity
    p @cart_quantity
    if found_item
    p "cart1"
    p @cart_quantity
      found_item.increment(cart_quantity)
    else
    p "cart2"  
    p @cart_quantity
      @items << CartItem.new(ticket_type_id)
      found_item = items.find { |item| item.ticket_type_id == ticket_type_id }
      found_item.increment(cart_quantity-1)
    end
  end

  def empty?
    items.empty?
  end

  def total_price
    items.reduce(0) { |sum, item| sum + item.price }
  end

  def total_quantity
    items.reduce(0) { |sum, item| sum + item.quantity }
  end

  def serialize
    all_items = items.map { |item|
      { "ticket_type_id" => item.ticket_type_id, "quantity" => item.quantity}
    }

    { "items" => all_items }
  end

  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map { |item_hash|
        CartItem.new(item_hash["ticket_type_id"], item_hash["quantity"])
      }
    end
  end
end
