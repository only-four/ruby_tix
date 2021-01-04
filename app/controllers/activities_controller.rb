class ActivitiesController < ApplicationController
    # before_action :find_activity, :only []

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
        redirect_to activities_path(@activity.id)  , notice: "新增活動成功！ 請繼續新增活動票種"
        # redirect_to activities_path, notice: "新增活動成功！", "請繼續新增活動票種"
       else
        render :new
      end
    end

    def join
      @activity = Activity.find(params[:id])
      @activity.activity_users.create if @activity
      redirect_to activities_path, notice: "報名完成！"
    end

    def edit 
      @activity = Activity.find(params[:id])
    end  
    def update
      @activity = Activity.find(params[:id])
      if @activity.update(activity_params)
        redirect_to activities_path(@activity), notice: "資料更新成功!"      
      else
        render :edit
      end
    end
  
    def show
      @activity = Activity.find(params[:id])
      @comment= @activity.comments.new
      # show comments
      @activity = Activity.find(params[:id])
      @comments= activity.comments.order(updated_at: :desc)
    end

    def date_field
      change(min: 0)
    end  

    def destroy
      @activity = Activity.find(params[:id])
      @activity.destroy if @activity
      redirect_to activities_path, notice: "活動資料已刪除!"
    end
  
  private
  def activity_params
    params.require(:activity).permit(
      :user,
      :user_id,
      :title,
      :begin_datetime,
      :finish_datetime,
      :location,
      :content,
      :brief,
      :tag,
      :link,
      :form,
      :notice,
      :phone,
      :email, 
      :other_contect, 
      :limit,
      ticket_types_attributes: [:id, :title, :content, :quantity, :sell_start, :sell_deadline, :price, :_destroy],
      address_attributes: [:location, :id, :_destroy]  )
  end 
  # def find_activity
  #   @activity = Activity.find_by(id: params[:id])
  # end

end
