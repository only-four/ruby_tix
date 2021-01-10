class QrCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_qr_data, only: :create

  def scan
    # p params
    # @params_activity = params[:activity_id]
  end

  def create         
    @params_activity = params[:activity_id]
    ticket= Ticket.find_by(ticket_number: @qr_data)
    ticket_type = TicketType.find_by(id:ticket.ticket_type_id)
    ticket_activity = Activity.find_by(id:ticket_type.activity_id)
    if ticket.state == "activated" && ticket_activity.id == @params_activity 
      qr_code = QrCode.create(data: @qr_data)
      redirect_to participated_qr_code_path(qr_code)
      ticket.use!       
    else
      render :scan
    end
  end

  def participated
    @qr_code = QrCode.find(params[:id])
    @current_ticket= Ticket.find_by(ticket_number:@qr_code.data)
    @current_tickettype = TicketType.find_by(id:@current_ticket.ticket_type_id)
  end

  def attand_list
    @qr_codes = QrCode.order(created_at: :desc).first(20)
    # @current_ticket= Ticket.find_by(ticket_number:@qr_code.data)
    # @current_tickettype = TicketType.find_by(id:@current_ticket.ticket_type_id)
    # @current_activity = Activity.find_by(id:@current_tickettype.activity_id)
  end

  private

  def set_qr_data
    qr_code_params = JSON.parse(params[:qr_code_json_data]).with_indifferent_access
    @qr_data = qr_code_params[:qr_data]
  end
end
