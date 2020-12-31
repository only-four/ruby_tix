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

  private 
  def gateway
    Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => '66rm3qq3n5pznyds',
      :public_key => 'fmqskbv7hbt2vqmb',
      :private_key => '5a0cfcdc31ac7fae902c35aac763de32',
    )
  end

end