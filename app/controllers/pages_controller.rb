class PagesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def purchase
  end

  def questions
  end

  def handle
  end

  def sales
  end

  def about_us
  end

  def service_center
  end

  def terms
  end


  def search
    @search_value = Activity.where('title ILIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.json {render json: @search_value}
    end
  end
end
