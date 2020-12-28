class TicketTypesController < ApplicationController
  
  def choose_ticket
    @activity = Activity.find(params[:activity_id])
    @ticket_types = @activity.ticket_types
  end

  def index
    @activity = Activity.find(params[:activity_id])
    @ticket_types = @activity.ticket_types.order(updated_at: :desc)
  end

  def destroy
    @ticket_types = TicketType.find_by(id: params[:id])
    @ticket_types.destroy
    redirect_to activity_ticket_types_path
  end





end
