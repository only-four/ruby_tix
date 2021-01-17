class QrCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :host?
  before_action :set_qr_data, only: :create

  def attand_list
    @qr_codes = QrCode.order(created_at: :desc).where(event: params[:activity_id])
    @tickets= Ticket.where(event:params[:activity_id]).includes(:order)
    @attand_list_activity_id = params[:activity_id]
  end

  def scan 
    @current_activity_id = params[:activity_id]
  end

  def create         
    ticket= Ticket.find_by(ticket_number: @qr_data)

    if ticket.may_use?
      qr_code = QrCode.create(data: @qr_data)
      ticket.use!       
      qr_code.update(event: ticket.event)
      redirect_to participated_activity_qr_code_path(@current_activity_id ,qr_code)
    else
      render :scan
    end
  end

  def participated
    @qr_code = QrCode.find(params[:id])
    @qr_codes = QrCode.order(created_at: :desc)
    @attand_list_activity_id = params[:activity_id]
  end

  def manual_attand  
    QrCode.create(data: params[:unAttandData])
    Ticket.find_by(ticket_number: params[:unAttandData]).update(state:"used")
    
  end

  private
    def host?
      unless current_user.id == Activity.find(params[:activity_id]).user_id
        redirect_to '/', notice: "您沒有權限"
      end   
    end

    def set_unattand_data
      params = JSON.parse(params[:unAttandData])    
      @unattand= params[:unAttandData]
    end

    def set_qr_data
      qr_code_params = JSON.parse(params[:qr_code_json_data]).with_indifferent_access
      @qr_data = qr_code_params[:qr_data]
      @current_activity_id = qr_code_params[:activity_id]
    end
end
