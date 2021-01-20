class SeatsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_seat_params ,only: :update

  def show
    @seats = Seat.all.order(id: :asc)
  end

  def update
    current_seat = Seat.find(params[:seat_id])
    current_seat.update(available:"F", taken_by: current_user.id, state: "taken")
  end

  private
  # def set_seat_params
  #   params= JSON.parse(params[:data]).with_indifferent_access
  #   @seat_id= params[:seat_id]
  # end
end
