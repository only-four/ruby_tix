class SeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seat_params ,only: :update

  def show
    @seats = Seat.all.order(id: :asc)
  end

  def update
    Seat.find_by(seat_num: seat_params[:seat_number]).update(available:"F", taken_by: current_user.id)
  end

  private
  def set_seat_params
    seat_params= JSON.parse(params[:data])
  end
end
