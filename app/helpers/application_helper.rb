module ApplicationHelper

  # 税込み表示
  def tax(price)
    (price * 1.1).floor
  end
  # orderでも使うことができる
  def price_one(cart_item)
    tax(cart_item.item.price * cart_item.quantity)
  end

  def price_all(cart_items)
    initial_price = 0
    cart_items.each do |c|
      initial_price += price_one(c)
    end
    return initial_price
  end
end
