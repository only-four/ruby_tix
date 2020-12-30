module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session[:cart7749])
  end
end