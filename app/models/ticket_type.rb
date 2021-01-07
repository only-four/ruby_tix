class TicketType < ApplicationRecord
  include AASM  
  validates :price, :title, :quantity, :sell_start, :sell_deadline, presence: true 
  belongs_to :activity
  has_many :tickets
  has_rich_text :content

  aasm column: 'state' do 
    state :pending, initial: true
    state :on_sell, :fully_booked, :sell_closed

    event :on_sell do
      transitions from: :pending, to: :on_sell
    end

    event :fully_book do
      transitions from: :on_sell, to: :fully_booked
    end

    event :sell_close do
      transitions from: [:fully_booked, :on_sell], to: :sell_closed
    end
  end  

  # def during_selling_period?
  #   if Time.now > ticket_type.sell_start && Time.now < ticket_type.sell_deadline
  #     ticket_type.on_sell!
  #   end  
  # end
end