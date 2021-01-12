class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    @chatroom_users = current_user.chatroom_users.find_by(chatroom_id: params["id"])
    @Chatroom = @chatroom_users.chatroom
    stream_for @Chatroom
  end

  def unsubscribed
    stop_all_streams
  end

  def touch
    @chatroom_user.touch(:last_read_at)
  end
end
