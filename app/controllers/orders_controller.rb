class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders.order(id: :desc)
    else
<<<<<<< HEAD
      redirect_to '/users/sign_up', notice:"請先註冊或登入會員"
=======
      redirect_to '/users/sign_up', notice:'請先註冊或登入會員'
>>>>>>> dev
    end
  end

  def create
    @order = current_user.orders.build(order_params)
    @order[:price] = current_cart.total_price.to_i
    current_cart.items.each do |item|
<<<<<<< HEAD
      @order.order_items.build(ticket_types_id: item.ticket_type_id, quantity: item.quantity)
    end

    if @order.save
      resp = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/request") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-LINE-ChannelId'] = ENV["line_pay_channel_id"]
        req.headers['X-LINE-ChannelSecret'] = ENV["line_pay_channel_secret"]
        req.body = {
                      productName: "RubyTix",
                      productImageUrl: "https://www.flaticon.com/svg/static/icons/svg/2850/2850737.svg",
                      amount: current_cart.total_price.to_i,
                      currency: "TWD",
                      confirmUrl: "http://localhost:5000/orders/confirm",
                      orderId: @order.num
                   }.to_json
=======
      @order.order_items.build(ticket_types_title: item.ticket_type_id, quantity: item.quantity)
      # @order.save
      @ticket = @order.tickets.build(ticket_type_id: item.ticket_type_id)
    end 

    if @order.save && @ticket.save
      response = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/request") do |req|
        request_header(req)
        req.body = {
          productName: "RubyTix",
          productImageUrl: "https://www.flaticon.com/svg/static/icons/svg/2850/2850737.svg",
          amount: current_cart.total_price.to_i,
          currency: "TWD",
          confirmUrl: "http://localhost:5000/orders/confirm",
          orderId: @order.num
        }.to_json
>>>>>>> dev
      end
      result = JSON.parse(response.body)
      if result["returnCode"] == "0000"
        @ticket.activate!
        payment_url = result["info"]["paymentUrl"]["web"]
        redirect_to payment_url
      else
        flash[:notice] = "付款失敗"
        render "cart/checkout"
      end
    end
  end

  def confirm
    response = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/#{params[:transactionId]}/confirm") do |req|
      request_header(req)
      req.body = {
        amount: current_cart.total_price.to_i,
        currency: "TWD",
      }.to_json
    end
    result = JSON.parse(response.body)

    if result["returnCode"] == "0000"
      order_id = result["info"]["orderId"]
      transaction_id = result["info"]["transactionId"]
      order = current_user.orders.find_by(num: order_id)
      order.pay!(transaction_id: transaction_id)
      session[:cart7749] = nil
      redirect_to orders_path, notice: "付款完成"
    else
      redirect_to checkout_cart_path, notice: "付款發生錯誤"
    end
  end

  def cancel
    @order = current_user.orders.find(params[:id])

    if @order.paid?
      response = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/#{@order[:transaction_id]}/refund") do |req|
        request_header(req)
      end
      result = JSON.parse(response.body)

      if result["returnCode"] == "0000"
      @order.refund!
        redirect_to orders_path, notice: "訂單 #{@order.num}已完成退款"
      else
        redirect_to orders_path, notice: "退款失敗"
      end
    else
        redirect_to root_path
    end
  end

  # pending狀態的訂單要付款時使用，此時藉由current_user所建立的訂單來找尋該訂單id，與create時的code雷同，差別在於不從購物車中找訂單
  def pay
    @order = current_user.orders.find(params[:id])
<<<<<<< HEAD
    resp = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/request") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-LINE-ChannelId'] = "1655423053"
      req.headers['X-LINE-ChannelSecret'] = "85852ff615ac559df286663802382d07"
      req.body = {
                    productName: "RubyTix",
                    productImageUrl: "https://www.flaticon.com/svg/static/icons/svg/2850/2850737.svg",
                    amount: @order[:price],
                    currency: "TWD",
                    confirmUrl: "http://localhost:5000/orders/#{@order.id}/pay_confirm",
                    orderId: @order.num
                 }.to_json
=======

    response = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/request") do |req|
      request_header(req)
      req.body = {
        productName: "RubyTix",
        productImageUrl: "https://www.flaticon.com/svg/static/icons/svg/2850/2850737.svg",
        amount: @order[:price],
        currency: "TWD",
        confirmUrl: "http://localhost:5000/orders/#{@order.id}/pay_confirm",
        orderId: @order.num
      }.to_json
>>>>>>> dev
    end
    result = JSON.parse(response.body)

    if result["returnCode"] == "0000"
      payment_url = result["info"]["paymentUrl"]["web"]
      redirect_to payment_url
    else
      redirect_to orders_path, notice: "付款發生錯誤"
    end
  end

  # pending狀態的訂單要付款時使用，與confirm API雷同
  def pay_confirm
    @order = current_user.orders.find(params[:id])

    response = Faraday.post("https://sandbox-api-pay.line.me/v2/payments/#{params[:transactionId]}/confirm") do |req|
      request_header(req)
      req.body = {
        amount: @order[:price],
        currency: "TWD",
      }.to_json
    end
    result = JSON.parse(response.body)

    if result["returnCode"] == "0000"
      transaction_id = result["info"]["transactionId"]
      @order.pay!(transaction_id: transaction_id)
      session[:cart7749] = nil
      redirect_to orders_path, notice: "付款完成"
    else
      redirect_to orders_path, notice: "付款發生錯誤"
    end
  end

<<<<<<< HEAD
  def show
  end

=======
>>>>>>> dev
  private
  def order_params
    params.require(:order).permit(:tel, :address, :participant)
  end
<<<<<<< HEAD
end
=======

  def request_header(request)
    request.headers = {
      'Content-Type': 'application/json',
      'X-LINE-ChannelId': ENV["line_pay_channel_id"],
      'X-LINE-ChannelSecret': ENV["line_pay_channel_secret"],
    }
  end
end
>>>>>>> dev
