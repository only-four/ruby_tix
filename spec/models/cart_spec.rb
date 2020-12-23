require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
   it '可以把票券丟到到購物車裡，然後購物車裡就有東西了' do
    cart = Cart.new
    cart.add_item 1
    expect(cart.empty?).to be false
   end

   it "如果加了相同種類的票券到購物車裡，購買項目（CartItem）並不會增加，但票的數量會改變" do
    cart = Cart.new                             # 新增一台購物車
    3.times { cart.add_item(1) }                # 加了 3 次的 1
    5.times { cart.add_item(2) }                # 加了 5 次的 2
    2.times { cart.add_item(3) }                # 加了 2 次的 3

    expect(cart.items.length).to be 3           # 總共應該會有 3 個 item
    expect(cart.items.first.quantity).to be 3   # 第 1 個 item 的數量會是 3
    expect(cart.items.second.quantity).to be 5  # 第 2 個 item 的數量會是 5
  end

  it "商品可以放到購物車裡，也可以再拿出來" do
    cart = Cart.new
    p1 = Product.create(title:"七龍珠")               # 建立商品 1
    p2 = Product.create(title:"冒險野郎")             # 建立商品 2

    4.times { cart.add_item(p1.id) }                 # 放了 4 次的商品 1
    2.times { cart.add_item(p2.id) }                 # 放了 2 次的商品 2

    expect(cart.items.first.product_id).to be p1.id  # 第 1 個 item 的商品 id 應該會等於商品 1 的 id
    expect(cart.items.second.product_id).to be p2.id # 第 2 個 item 的商品 id 應該會等於商品 2 的 id
    expect(cart.items.first.product).to be_a Product # 第 1 個 item 拿出來的東西應該是一種商品
  end


  end
end