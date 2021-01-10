class QrCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_qr_data, only: :create

  def attand_list
    @qr_codes = QrCode.order(created_at: :desc).first(20)
  end

  def scan
  end

  def create         
    qr_code = QrCode.create(data: @qr_data)
    redirect_to participated_qr_code_path(qr_code)
    ticket.use!       
    # ticket= Ticket.find_by(ticket_number: @qr_data)
    # if ticket.state == "activated"
    # else
    #   render :scan
    # end
  end

  def participated
    @qr_code = QrCode.find(params[:id])
    @current_ticket= Ticket.find_by(ticket_number:@qr_code.data)
    @current_tickettype = TicketType.find(id:@current_ticket.ticket_type_id)
    @current_activity = Activity.find(id:@current_tickettype.activity_id)
  end

  private

  def set_qr_data
    qr_code_params = JSON.parse(params[:qr_code_json_data]).with_indifferent_access
    @qr_data = qr_code_params[:qr_data]
  end
end
