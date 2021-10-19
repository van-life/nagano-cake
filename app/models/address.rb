class Address < ApplicationRecord
  belongs_to :customer
  
  def order_adress
    "〒#{self.postal_code self.address self.name}"
  end
end
