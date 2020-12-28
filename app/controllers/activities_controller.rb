class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
<<<<<<< HEAD
    @activity = Activity.new
    2.times { @activity.ticket_types.build }
  end

=======
    @activities = Activity.new    
  end
>>>>>>> 64639c83c58488e8be3ca6a3498095773fd993ac
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: "新增活動成功！"
    else
      render :new
    end
  end
<<<<<<< HEAD

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
      
    
=======
  
  def edit
    @activity = Activity.find_by(id: params[:id])    
>>>>>>> 64639c83c58488e8be3ca6a3498095773fd993ac
  end
  def destroy
    @activity = Activity.destroy  
  end
  private
  def activity_params
    params.require(:activity).permit(:user, :user_id, :title, :begin_datetime, :finish_datetime,
       :location, :content, :brief, :tag, :link, :form, :notice,  :phone, :email, :other_contect, 
<<<<<<< HEAD
       :limit, ticket_types_attributes: [:id, :title, :content, :quantity, :price, :_destroy],
       :address_attributes: [:location, :id, :_destroy], 
       :free_ticket, :vip_ticket, :pr_ticket )
  end

=======
       :limit, address_attributes: [:location, :id, :_destroy]  )
  end
>>>>>>> 64639c83c58488e8be3ca6a3498095773fd993ac
end

