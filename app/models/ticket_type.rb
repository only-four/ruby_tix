class TicketType < ApplicationRecord
  include AASM  
  validates :price, :title, :quantity, :sell_start, :sell_deadline, presence: true 
  belongs_to :activity
  has_many :tickets

  aasm column: 'state' do 
    state :pending, initial: true
    state :on_sale, :fully_booked, :sale_closed

    event :on_sale do
      transitions from: :pending, to: :on_sale
    end

    event :fully_book do
      transitions from: :on_sale, to: :fully_booked
    end

    event :sale_close do
      transitions from: [:fully_booked, :on_sale], to: :sale_closed
    end
  end  

  # def during_selling_period?
  #   if Time.now > ticket_type.sell_start && Time.now < ticket_type.sell_deadline
  #     ticket_type.on_sale!
  #   end  
  # end
end