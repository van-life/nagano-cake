# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 以下、のちに削除（しうへい）
Customer.create!(
  email: 'e@gmail.com',
  password: 'aaaaaaa',
  first_name: 'a',
  last_name: 'a',
  first_name_kana: 'a',
  last_name_kana: 'a',
  postal_code: '1111111',
  address: 'a',
  telephone_number: '11111111111',
  is_deleted: 'false'
)

Order.create!(
  customer_id: '5',
  postal_code: '1111111',
  address: 'a',
  name: 'a',
  total_price: '500'
  )

OrderItem.create!(
  item_id: '1',
  order_id: '5',
  quantity: '3',
  price: '500'
  )
  
OrderItem.create!(
item_id: '2',
order_id: '5',
quantity: '4',
price: '1000'
)