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

  def show
    @activity = Activity.find(params[:id])
    @comment= @activity.comments.new
    
    # show comments
    activity = Activity.find(params[:id])
    @comments= activity.comments.order(updated_at: :desc)
    
    respond_to do |format|
      format.html
      format.js
    end
  end


  private
  def activity_params
    params.require(:activity).permit(:begin_datetime, :finish_datetime, ticket_types_attributes: [:id, :title, :content, :quantity, :sell_start, :sell_deadline,:price, :_destroy])
  end
end
