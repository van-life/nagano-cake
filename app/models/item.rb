class Item < ApplicationRecord
  
  # genreモデルにデータがないと機能しないため、一旦「optional:true」追加（しうへい）
  belongs_to :genre, optional: true
  has_many :order_items, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  
  attachment :image
  
  validates :name, :introduction, :genre_id, :price, presence: true
end
