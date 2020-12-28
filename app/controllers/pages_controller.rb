class PagesController < ApplicationController
  # before_action :authenticate_user!
  def index
  end

  def footer_page
  end

  def search
    p params[:search]
    # ILIKE & LIKE
    # limit(2) -> 搜尋前兩個
    @search_value = User.where('email ILIKE ?', "%#{params[:search]}%").limit(2)
    respond_to do |format|
      format.json {render json: @search_value}
    end
  end
end
