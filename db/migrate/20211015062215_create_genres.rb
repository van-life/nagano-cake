class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
