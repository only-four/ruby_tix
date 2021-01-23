class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to favorites_path, notice: '新增成功'
    else
      render :new
    end    
  end

  def edit
    @favorite = Favorite.find_by(id: params[:id])
  end

  def update
    @favorite = Favorite.find_by(id: params[:id])
    if @favorite.update(favorite_params)
      redirect_to favorites_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    Favorite.destroy if @favorite
    redirect_to favorites_path, notice: '刪除成功'
  end

  private
  def favorite_params
    params.require(:favorite).permit(:id, :name)
  end

end
