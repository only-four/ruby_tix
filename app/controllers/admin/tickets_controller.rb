class Admin::TicketsController < ApplicationController
  def new
    @ticket = Ticket.new; @ticket.ticket_types.build
  end
end