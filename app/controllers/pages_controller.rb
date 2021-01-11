class PagesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def footer_notice
  end

  def questions
  end

  def sell_purchase
  end

  def service_centre
  end

  def dervice_terms
  end

  def abouts_us
  end

  def process_method
  end

  def search
    @search_value = Activity.where('title ILIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.json {render json: @search_value}
    end
  end
end
