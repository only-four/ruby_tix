class TicketType < ApplicationRecord
  include AASM  
  validates :price, :title, :quantity, :sell_start, :sell_deadline, presence: true 
  belongs_to :activity
  has_many :tickets

  aasm column: 'state', no_direct_assignment: true do 
    state :pending, initial: true
    state :on_sell, :fully_booked, :sell_closed

    event :on_sell do
      transitions from: :pending, to: :on_sell
      # after do
        
      # end
    end

    event :fully_book do
      transitions from: :on_sell, to: :fully_booked
    end

    event :sell_close do
      transitions from: [:fully_booked, :on_sell], to: :sell_closed
    end
  end  
end