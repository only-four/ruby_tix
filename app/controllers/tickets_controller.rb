class TicketsController < ApplicationController
  
  # 顯示使用者票券
  def show
    @ticket = Ticket.find(params[:id])
    owner_id = @ticket.order.user_id
    @ticket_owner= User.find(owner_id)
  end
end