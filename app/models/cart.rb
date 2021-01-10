class Cart
  attr_reader :items
  SessionKey = :cart7749

  def initialize(items = [])
    @items = items
  end

  def add_item(ticket_type_id)
    found_item = items.find { |item| item.ticket_type_id == ticket_type_id }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(ticket_type_id)
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
