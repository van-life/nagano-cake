class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :address,:name,:postage,:postal_code,:total_price, presence: true

  enum payment: {クレジットカード: 0, 銀行振込: 1}

end
