class TicketTypesController < ApplicationController
  
  def choose_ticket
    @ticket_types = TicketType.all
    @activity = Activity.all
  end

  def index
    @activity = Activity.find(1)
    @ticket_types = @activity.ticket_types
  end

  def destroy
    p params
    @ticket_types = TicketType.find_by(activity_id: params[:activity_id])
    @ticket_types.destroy
    redirect_to activity_ticket_types_path
  end




  private 


end
