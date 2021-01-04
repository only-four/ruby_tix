class CartsController < ApplicationController
  def add
    ticket_types = TicketType.find_by(id: params[:id])

    current_cart.add_item(ticket_types.id)
    session[:cart7749] = current_cart.serialize

    p params
    # redirect_to activity_ticket_types_path(ticket_types.activity_id), notice: "已加入購物車"
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to cart_path, notice: '購物車已清空'
  end

  def show
  end

  def checkout
    @order = current_user.orders.build
  end


end