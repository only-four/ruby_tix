class Order < ApplicationRecord
  include AASM
  before_create :generate_ordernumber
  belongs_to :user
  has_many :order_items
  validates :participant, :tel, :address, presence: true
  
  aasm column: :state do
    state :pending, initial: true
    state :paid, :refunded, :completed

    event :pay do
      transitions from: :pending, to: :paid
      before do |args|
        self.transaction_id = args[:transaction_id]
        self.paid_at = Time.now
      end
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end

    event :compelte do
      transitions from: :paid, to: :completed
    end
  end
  
    private
    def generate_ordernumber
      self.num = SecureRandom.hex(5) unless num
    end
end