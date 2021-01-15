class SeatsController < ApplicationController
  def show
    @seats = Seat.all.order(id: :asc)
  end
end
