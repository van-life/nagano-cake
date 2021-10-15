class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      
      t.integer :quantity, null: false, default: ""
      t.integer :create_status, null: false, default: "0"
      t.integer :price, null: false, default: ""

      t.timestamps
    end
  end
end
