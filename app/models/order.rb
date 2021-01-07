class Order < ApplicationRecord
  before_create :generate_ordernumber
  belongs_to :user
  has_many :order_items

  validates :participant, :tel, :address, presence: true
  include AASM
  
  aasm column: :state do
    state :pending, initial: true
    state :paid, :refunded, :completed

    event :pay do
      transitions from: :pending, to: :paid

      before do |args|
        self.transaction_id = args[:transaction_id]
        self.paid_at = Time.now
      end

      after do
        # 寄發email，已支付款項
      end
    end

    event :refund do
      transitions from: :paid, to: :refunded

      after do
        # 寄發email，已完成退款
      end
    end

    event :compelte do
      transitions from: :paid, to: :completed
    end
  end

    # 產生訂單編號
    private
    def generate_ordernumber
      self.num = SecureRandom.hex(5) unless num
    end

end
