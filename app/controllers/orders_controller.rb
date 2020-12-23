class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(clean_params)
    if @order.save
      redirect_to '#'
    else
    end
  end

  def show
    @order = Order.find_by(id:params[:id])
  end

  private
  clean_params = params.require(:order).permit(:address)
  end

end