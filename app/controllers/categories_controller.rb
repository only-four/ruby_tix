class CategoriesController < ApplicationController
  before_action :admin_identify

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: '新增成功'
    else
      render :new
    end    
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    Category.destroy if @category
    redirect_to categories_path, notice: '刪除成功'
  end

  private
  def category_params
    params.require(:category).permit(:id, :name)
  end

  def admin_identify
    redirect_to root_path unless current_user.has_role? :admin
  end

end
