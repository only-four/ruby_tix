class TicketsController < ApplicationController
  before_action :authenticate_user!
  
  def my_tickets
    @my_orders= Order.where(user_id: current_user.id)
    @tickets= Ticket.where(order_id: @my_orders.ids).includes(:ticket_type)
    # render json: @tickets
  end

  def attend_event
    @ticket= Ticket.find(params[:id])
    if @ticket.event_attandance.nil?
      @event_attandance = @ticket.create_event_attandance(ticket_number: @ticket.ticket_number)
      @ticket.use! if params[:use]
      redirect_to attend_event_result_ticket_path(@ticket)
    else
      redirect_to '/', notice: '票券已使用'
    end
  end
  
  def attend_event_result; end

  private
  def event_attandance_params
    params.require(:event_attandance).permit(:ticket_number)
  end
end