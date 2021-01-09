class ActivitiesController < ApplicationController
    # 登入檢查
    before_action :find_activity, only: [:join, :edit, :destroy, :update, :show]

    def index
      @activities = Activity.all
      # @activities = Activity.available
    end
  
    def new
      @activity = Activity.new
      2.times { @activity.ticket_types.build }
    end 

    def create
      @activity = Activity.new(activity_params)
      if @activity.save!
        redirect_to activities_path(@activity), notice: "新增活動成功！ 請繼續新增活動票種"
       else
        render :new
      end
    end

    def join
      @activity.activity_users.create if @activity
      redirect_to activities_path, notice: "報名完成！"
    end

    def edit; end

    def update
      p params     
      if @activity.update(activity_params)
        # TODO:這邊要處理掉
        b = @activity.ticket_types.new(title:params[:activity][:ticket_types_attributes][:"0"][:title], 
          quantity:params[:activity][:ticket_types_attributes][:"0"][:quantity].to_i, 
          price:params[:activity][:ticket_types_attributes][:"0"][:price].to_i, 
          sell_start:params[:activity][:ticket_types_attributes][:"0"][:sell_start], 
          sell_deadline:params[:activity][:ticket_types_attributes][:"0"][:sell_deadline])
        if b.save!
        redirect_to activities_path(@activity), notice: "資料更新成功!" 
        else        
          root_path
        end
      else
        root_path
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
      :title,
      :is_available,
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
      :other_contact, 
      :limit,
      :image,
      ticket_types_attributes: [:id, :title, :content, :quantity, :sell_start, :sell_deadline, :price, :_destroy, :valid_at, :expire_at],
      address_attributes: [:location, :id, :_destroy]  )
  end 

  def find_activity
    @activity = Activity.find(id: params[:id])
  end
end
