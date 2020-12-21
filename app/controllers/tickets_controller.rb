class TicketsController < ApplicationController
  def index
    @ticket_types= TicketType.where(ticket_id: 18)
  end
end
