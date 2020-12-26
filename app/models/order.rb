class Order < ApplicationRecord
  include AASM
  
  aasm column: :state do
    state :pending, initial: true
    state :paid, :refund, :completed

    event :pay do
      transitions from: :pending, to: :paid
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

end
