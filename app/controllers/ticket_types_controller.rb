class TicketTypesController < ApplicationController
  before_action :find_activity, except:[:destroy]
  
  def choose_ticket
    @ticket_types = @activity.ticket_types
  end

  def index
    @ticket_types = @activity.ticket_types.order(updated_at: :desc)
  end

  # def update
  #   update_ticket_type = TicketType.find_by(title: parmas[:title])

  #   params[:some].each do |x|
  #     update_ticket_type.
  #   end
  # end
  def destroy
    @ticket_types = TicketType.find_by(id: params[:id])
    @ticket_types.destroy
    redirect_to activity_ticket_types_path
  end

  private
  def find_activity
    @activity = Activity.find(params[:activity_id])    
  end
end
