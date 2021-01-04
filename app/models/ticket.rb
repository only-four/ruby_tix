class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_create :generate_ticket_number

  private
  def generate_ticket_number
    self.ticket_number = Time.now.strftime("%Y%m%d")+SecureRandom.alphanumeric(5)
  end

end