class TicketsController < ApplicationController
  before_action :authenticate_user!


  # 顯示使用者票券
  def my_tickets
    @my_orders= Order.where(user_id: current_user.id)
    @tickets= Ticket.where(order_id: @my_orders.ids)
  end

end