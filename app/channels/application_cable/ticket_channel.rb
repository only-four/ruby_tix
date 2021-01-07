class TicketChannel < ActionCable::Connection::Base

  def subscribed
    # stream_from "ticket_#{params[:room]}"
  end
end