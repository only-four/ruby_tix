class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    2.times { @activity.ticket_types.build }
  end

  def edit
    @activity= Activity.find(params[:id])
  end

  def update
    @activity= Activity.find(params[:id])
    
    if @activity.update(activity_params)
      redirect_to activity_ticket_types_path(@activity)      
    else
      render :edit
    end
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_ticket_types_path(@activity.id)
    else
      
    end
  end


  private
  def activity_params
    params.require(:activity).permit(:begin_datetime, :finish_datetime, ticket_types_attributes: [:id, :title, :content, :quantity, :price, :_destroy])
  end
end
