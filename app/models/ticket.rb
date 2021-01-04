class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_create :generate_ticket_number
  has_one :event_attandance

#   include AASM
#   aasm column: :state do
#     state :activate, initial: true
#     state :used
#     state :expired

#     event :use do
#       transitions  :from => :activate, :to => :used
#     end

#     event :expire do
#       transitions :from => :activate, :to => :expired
#     end
#   end
# end


  private
  def generate_ticket_number
    self.ticket_number = Time.now.strftime("%Y%m%d")+SecureRandom.alphanumeric(5)
  end

end