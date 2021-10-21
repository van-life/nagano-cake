module ApplicationHelper
  
  # 税込み表示
  def tax(price)
    (price * 1.1).floor
  end
  
end
