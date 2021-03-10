class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @chatroom.chatroom_users.where(user: current_user).first_or_create!
    redirect_to @chatroom
  end

  def destroy
    @chatroom.chatroom_users.where(user: current_user).destroy_all
    redirect_to @chatroom
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end