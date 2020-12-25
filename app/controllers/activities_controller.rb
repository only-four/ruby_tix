class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activities = Activity.new    
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
    @activity = Activity.find_by(id: params[:id])    
  end
  def destroy
    @activity = Activity.destroy  
  end
  private
  def activity_params
    params.require(:activity).permit(:user, :title, :begin_datetime, :finish_datetime,
       :location, :content, :brief, :tag, :link, :form, :notice,  :phone, :email, :other_contect, 
       :limit, :free_ticket, :vip_ticket, :pr_ticket, address_attributes: [:location, :id, :_destroy]  )
  end
end

