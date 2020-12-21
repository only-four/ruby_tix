class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    2.times { @activity.ticket_types.build }
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: "新增活動成功！"
    else
      render :new
    end
  end

  def edit
    @activity= Activity.find(params[:id])
  end

  def update
    @activity= Activity.find(params[:id])
    # @activity = Activity.find_by(id: params[:id])  
    
    if @activity.update(activity_params)
      redirect_to activity_ticket_types_path(@activity)      
    else
      render :edit
    end
      
  end

  private
  def activity_params
    params.require(:activity).permit(:user, :title, :begin_datetime, :finish_datetime,
       :location, :content, :brief, :tag, :link, :form, :notice,  :phone, :email, :other_contect, 
       :limit, :free_ticket, :vip_ticket, :pr_ticket, ticket_types_attributes: [:id, :title, :content, :quantity, :price, :_destroy]  )
  end
end

