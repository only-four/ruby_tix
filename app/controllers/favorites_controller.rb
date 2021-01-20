class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    p "111"
    # @search_value = Activity.where('title ILIKE ?', "%#{params[:search]}%")
    # respond_to do |format|
    #   format.json {render json: @search_value}
    # end
  end
end
