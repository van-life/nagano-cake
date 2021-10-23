class Address < ApplicationRecord
  belongs_to :customer
  
  validates :name, {presence: true}
  validates :address, {presence: true}
  validates :postal_code, {presence: true ,numericality: true, length: { is: 7 } }
  
  def order_address
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end
end
