class Admin::TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
    @ticket_types= TicketType.all
  end


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

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to '/'
    else
      render :edit
    end
  end


  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy
      redirect_to '/'
    end
  end

  


  private
  def ticket_params
    params.require(:ticket).permit(:begin_datetime, :finish_datetime, ticket_types_attributes: [:id, :title, :content, :quantity, :price, :_destroy])
  end


end