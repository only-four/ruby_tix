class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @message = @chatroom.messages.create(message_params)
    MessageChannel.broadcast_to @chatroom, message: render_to_string(@message)
  end

  private
  def set_chatroom
    @chatroom = current_user.chatrooms.find(params[:chatroom_id])
  end

  # 透過.merge方法可以將兩個hash合併
  def message_params
    params.require(:message).permit(:body).merge(user:current_user)
  end
end