class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def total_price
    item.price*1.1*quantity.floor
  end
  
end
