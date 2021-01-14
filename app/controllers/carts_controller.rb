class CartsController < ApplicationController
  before_action :authenticate_user!
  def add
    ticket_types = TicketType.find_by(id: params[:id])
    current_cart.add_item(ticket_types.id)
    session[:cart7749] = current_cart.serialize
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: '購物車已清空'
  end

  def show; end

  def checkout
    if current_user
      @order = current_user.orders.build
    else
      redirect_to new_session_path(:user)
    end
  end
end
