class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_activity, only: [:join, :edit, :destroy, :update, :show, :favorite]
  skip_before_action :verify_authenticity_token, only: [:favorite ]

  def index
    @activities = Activity.where(user_id: current_user.id)
  end

  def new
    @activity = current_user.own_activities.new
    @categories = Category.all
    @activity.ticket_types.build 
  end 
  
  def create
    @activity = current_user.own_activities.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity.id), notice: "新增活動成功！ 請繼續新增活動票種"
      @notice = current_user.notices.create(notices:flash[:notice])
    else
      render :new
    end
  end
  
  def join
    @activity.activity_users.create if @activity
    redirect_to activities_path, notice: "報名完成！"
    @notice = current_user.notices.create(notices:flash[:notice])
    render :new
  end
  
  def edit
    # @categories = Category.all
  end
  
  def update 
    if @activity.update(activity_params)
      redirect_to activity_path(@activity.id), notice: "資料更新成功!"      
    else
      render :edit
    end
  end

  def show
    @comment = @activity.comments.new
    @comments = @activity.comments.order(updated_at: :desc).includes(:user)
    # @activities = Activity.where(user_id: current_user.id)
    @activities = Activity.all
  end

  def destroy
    @activity&.destroy
    redirect_to activities_path, notice: "活動資料已刪除!"
  end

  def favorite
    if current_user.favorite?(@activity)
      # 移除我的最愛
      current_user.favorite_activities.destroy(@activity)
      render json: { status: 'removed' }
    else
      # 加到我最愛
      current_user.favorite_activities << @activity
      render json: { status: 'added' }
    end
  end

  def my_favorite
    @favorite_activities = current_user.favorite_activities
  end

  private
  def raw_activity_params
    params.require(:activity).permit(
      :content,
      :period,
      :title,
      :begin_datetime,
      :finish_datetime,
      :location,
      :location_guide,
      :content,
      :hostname,
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
      :category_id,
      ticket_types_attributes: [:id, :title, :content, :quantity, :sell_start, :sell_deadline, :price, :_destroy, :valid_at, :expire_at],
      address_attributes: [:location, :id, :_destroy]  )
  end 

  def find_activity
    @activity = Activity.find(params[:id])
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
  def activity_params
    @_activity_params = raw_activity_params
    begin_date  = @_activity_params[:begin_datetime].to_datetime
    finish_date = @_activity_params[:finish_datetime].to_datetime
    sell_start = @_activity_params[:ticket_types_attributes][:"0"][:sell_start].to_datetime
    sell_deadline = @_activity_params[:ticket_types_attributes][:"0"][:sell_deadline].to_datetime
    valid_at = @_activity_params[:ticket_types_attributes][:"0"][:valid_at].to_datetime
    expire_at = @_activity_params[:ticket_types_attributes][:"0"][:expire_at].to_datetime

    @_activity_params["begin_datetime(1i)"] = begin_date.strftime("%Y")
    @_activity_params["begin_datetime(2i)"] = begin_date.strftime("%m")
    @_activity_params["begin_datetime(3i)"] = begin_date.strftime("%d")
    
    @_activity_params["finish_datetime(1i)"] = finish_date.strftime("%Y")
    @_activity_params["finish_datetime(2i)"] = finish_date.strftime("%m")
    @_activity_params["finish_datetime(3i)"] = finish_date.strftime("%d")

    @_activity_params["ticket_types_attributes"]["0"]["sell_start(1i)"] = sell_start.strftime("%Y")
    @_activity_params["ticket_types_attributes"]["0"]["sell_start(2i)"] = sell_start.strftime("%m")
    @_activity_params["ticket_types_attributes"]["0"]["sell_start(3i)"] = sell_start.strftime("%d")

    @_activity_params["ticket_types_attributes"]["0"]["sell_deadline(1i)"] = sell_deadline.strftime("%Y")
    @_activity_params["ticket_types_attributes"]["0"]["sell_deadline(2i)"] = sell_deadline.strftime("%m")
    @_activity_params["ticket_types_attributes"]["0"]["sell_deadline(3i)"] = sell_deadline.strftime("%d")

    @_activity_params["ticket_types_attributes"]["0"]["valid_at(1i)"] = valid_at.strftime("%Y")
    @_activity_params["ticket_types_attributes"]["0"]["valid_at(2i)"] = valid_at.strftime("%m")
    @_activity_params["ticket_types_attributes"]["0"]["valid_at(3i)"] = valid_at.strftime("%d")

    @_activity_params["ticket_types_attributes"]["0"]["expire_at(1i)"] = expire_at.strftime("%Y")
    @_activity_params["ticket_types_attributes"]["0"]["expire_at(2i)"] = expire_at.strftime("%m")
    @_activity_params["ticket_types_attributes"]["0"]["expire_at(3i)"] = expire_at.strftime("%d")

    @_activity_params
  end

end
