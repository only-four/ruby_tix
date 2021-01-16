class SeatsController < ApplicationController
  def show
    @seats = Seat.all.order(id: :asc)
  end
  # def update
  #   Seat.find_by(seat_num: "#").update(available:"F", taken_by: current_user.id)
  # end
end
