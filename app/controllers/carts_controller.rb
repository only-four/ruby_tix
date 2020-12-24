class CartsController < ApplicationController
  def add
    current_cart.add_item(params[:id])
    session[Cart::SessionKey] = current_cart.serialize

    redirect_to products_path, notice: '已加入購物車'
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to products_path, notice: '購物車已清空'
  end

  def checkout

  end
end