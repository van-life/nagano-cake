class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, :item_id, :quantity, presence: true

  def total_price
    item.price*1.1*quantity.floor
  end

end
