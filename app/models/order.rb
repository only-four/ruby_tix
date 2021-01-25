class Order < ApplicationRecord
  include AASM
  before_create :generate_ordernumber
  belongs_to :user
  has_many :order_items
  has_many :tickets
  validates :participant, :address, presence: true
  
  aasm column: :state do
    state :未付款, initial: true
    state :已付款, :已退款, :已完成

    event :pay do
      transitions from: :未付款, to: :已付款
      before do |args|
        self.transaction_id = args[:transaction_id]
        self.paid_at = Time.now
      end
    end

    event :refund do
      transitions from: :已付款, to: :已退款
    end

    event :compelte do
      transitions from: :已付款, to: :已完成
    end
  end
  
    # 產生訂單編號
  private
  def generate_ordernumber
    self.num = SecureRandom.hex(5) unless num
  end
end
