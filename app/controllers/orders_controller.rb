class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new()
    if @order.save
      redirect_to '#'
    else
    end
  end

  def show
    @order = Order.find_by(id:params[:id])
  end

end