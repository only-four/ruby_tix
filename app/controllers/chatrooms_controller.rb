class ChatroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_chatroom, except: [:index, :new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom_user = current_user.chatroom_users.find_by(chatroom: @chatroom)
    @last_read_at = @chatroom_user&.last_read_at || @chatroom.created_at
    @chatroom_user&.touch(:last_read_at)
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to @chatroom, notice: '聊天室成功創立' }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to @chatroom, notice: '聊天室成功編輯' }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: '關閉聊天室' }
      format.json { head :no_content }
    end
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
