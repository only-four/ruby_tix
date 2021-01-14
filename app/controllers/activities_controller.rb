class ActivitiesController < ApplicationController
    # TODO：登入檢查
    before_action :find_activity, only: [:join, :edit, :destroy, :update, :show]

    def index
      @activities = Activity.all
    end
  
    def new
      @activity = Activity.new
      2.times { @activity.ticket_types.build }
    end 

    def create
      @activity = Activity.new(activity_params)
      if @activity.save!
        redirect_to activities_path(@activity.id), notice: "新增活動成功！ 請繼續新增活動票種"
        @notice = current_user.notices.create(notices:flash[:notice])
       else
        render :new
      end
    end

    def join
      @activity.activity_users.create if @activity
      redirect_to activities_path, notice: "報名完成！"
      @notice = current_user.notices.create(notices:flash[:notice])
    end

    def edit; end

    def update
      if @activity.update!(activity_params)
        redirect_to activities_path(@activity), notice: "資料更新成功!"      
      else
        render :edit
      end
    end
  
    def show
      @comment = @activity.comments.new
      @comments = @activity.comments.paginate(page: params[:page], per_page: 4).order(updated_at: :desc)
      respond_to do |format|
        format.html
        format.js
      end
    end

    def destroy
      @activity.destroy if @activity
      redirect_to activities_path, notice: "活動資料已刪除!"
    end
  
  private
  def activity_params
    params.require(:activity).permit(
      :content,
      # :user,
      # :user_id,
      :period,
      :title,
      :begin_datetime,
      :finish_datetime,
      :location,
      :content,
      :user_id, :hostname,
      :brief,
      :tag,
      :link,
      :form,
      :notice,
      :phone,
      :email, 
      :other_contact, 
      :limit,
      :image,
      ticket_types_attributes: [:id, :title, :content, :quantity, :sell_start, :sell_deadline, :price, :_destroy, :valid_at, :expire_at],
      address_attributes: [:location, :id, :_destroy]  )
  end 

  def find_activity
    @activity = Activity.find_by(id: params[:id])
  end
  def ticket_types_params
    title:params[:activity][:ticket_types_attributes][:"0"][:title], 
          quantity:params[:activity][:ticket_types_attributes][:"0"][:quantity].to_i, 
          price:params[:activity][:ticket_types_attributes][:"0"][:price].to_i, 
          sell_start:params[:activity][:ticket_types_attributes][:"0"][:sell_start], 
          sell_deadline:params[:activity][:ticket_types_attributes][:"0"][:sell_deadline],
          valid_at:params[:activity][:ticket_types_attributes][:"0"][:valid_at],
          expire_at:params[:activity][:ticket_types_attributes][:"0"][:expire_at]
  end

end
