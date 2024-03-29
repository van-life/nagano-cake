class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :genre_id
      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.string :image_id, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
