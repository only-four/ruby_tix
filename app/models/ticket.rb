class Ticket < ApplicationRecord
  include AASM
  belongs_to :ticket_type
  belongs_to :order
  before_create :generate_ticket_number
  has_one :event_attandance
  
  aasm column: 'state' do 
    state :pending, initial: true
    state :activated,:used, :expired

    event :activate do
      transitions from: :pending, to: :activated
    end

    event :use do
      transitions from: :activated, to: :used
    end

    event :expire do
      transitions from: :activated, to: :expired
    end
  end

  private
  def generate_ticket_number
    self.ticket_number = Time.now.strftime("%Y%m%d")+SecureRandom.alphanumeric(5)
  end
  
end