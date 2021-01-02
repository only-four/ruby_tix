class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    p current_cart
    current_cart.items.each do |item|
      @order.order_items.build(ticket_types_title: item.ticket_type_id, quantity: item.quantity)
    end

    if @order.save
      resp = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/request") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-LINE-ChannelId'] = "1655423053"
        req.headers['X-LINE-ChannelSecret'] = "85852ff615ac559df286663802382d07"
        req.body = {
                      productName: "Apple",
                      amount: current_cart.total_price.to_i,
                      currency: "TWD",
                      confirmUrl: "http://localhost:3000/orders/confirm",
                      orderId: @order.num
                   }.to_json
      end

      result = JSON.parse(resp.body)

      if result["returnCode"] == "0000"
        payment_url = result["info"]["paymentUrl"]["web"]
        redirect_to payment_url
      else
        flash[:notice] = '付款失敗'
        render 'cart/checkout'
      end
    end
  end

  def confirm
    resp = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/#{params[:transactionId]}/confirm") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-LINE-ChannelId'] = "1655423053"
      req.headers['X-LINE-ChannelSecret'] = "85852ff615ac559df286663802382d07"
      req.body = {
                    amount: current_cart.total_price.to_i,
                    currency: "TWD",
                 }.to_json
    end
    result = JSON.parse(resp.body)

    if result["returnCode"] == "0000"
      order_id = result["info"]["orderId"]
      transaction_id = result["info"]["transactionId"]

      order = current_user.orders.find_by(num: order_id)
      order.pay!(transaction_id: transaction_id)

      session[:cart7749] = nil
      redirect_to root_path, notice: '付款完成'
    else
      redirect_to root_path, notice: '付款發生錯誤'
    end

  end

  def show
    @order = Order.find_by(id:params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:tel, :address, :participant)
  end

end