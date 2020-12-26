class TicketTypesController < ApplicationController
  
  def choose_ticket
    @ticket_types = TicketType.all
    @activity = Activity.all
  end

  def index
    @activity = Activity.find(params[:activity_id])
    @ticket_types = @activity.ticket_types
  end

  def destroy
    p params
    @ticket_types = TicketType.find_by(id: params[:id])
    @ticket_types.destroy, notice: '票種已刪除'
    redirect_to activity_ticket_types_path
  end





end
