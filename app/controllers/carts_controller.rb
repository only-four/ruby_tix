class CartsController < ApplicationController
  before_action :authenticate_user!
  def add
    ticket_types = TicketType.find_by(id: params[:id])
    current_cart.add_item(ticket_types.id)
    session[Cart::SessionKey] = current_cart.serialize
  end

  def destroy
    byebug
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: '購物車已清空'
    @notice = current_user.notices.create(notices:flash[:notice])
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
