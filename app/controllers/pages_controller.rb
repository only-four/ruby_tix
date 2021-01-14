class PagesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def member
  end

  def guide
  end

  def faq
  end

  def join
  end

  def hold
  end

  def about_us
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
