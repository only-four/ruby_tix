class CartsController < ApplicationController
  def add
    current_cart.add_item(params[:id])
    session[:cart7749] = current_cart.serialize

    redirect_to activity_ticket_types_path(params[:id]), notice: "已加入購物車"
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: '購物車已清空'
  end

  def show
  end

  def checkout
    @order = Order.new
  end

end