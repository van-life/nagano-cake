class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      
      t.integer :quantity, null: false, default: ""

      t.timestamps
    end
  end
end
