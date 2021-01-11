class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for Chatroom.find(params["id"])
  end

  def unsubscribed
    stop_all_streams
  end
end
