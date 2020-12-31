class CartsController < ApplicationController
  def add
    ticket_types = TicketType.find_by(id: params[:id])

    current_cart.add_item(ticket_types.id)
    session[:cart7749] = current_cart.serialize

    p params
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
    @token = gateway.client_token.generate
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