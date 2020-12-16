class Admin::TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end
end