class Admin::TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
    2.times { @ticket.ticket_types.build }
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to '/'
    else
      render :new
    end
  end


  private
  def ticket_params
    params.require(:ticket).permit(:begin_datetime, :finish_datetime, ticket_types_attributes: [:title, :quantity, :price,:_destroy])
  end


end