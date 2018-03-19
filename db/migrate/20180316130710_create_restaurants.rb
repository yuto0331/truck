class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.text :image
      t.string :name
      t.string :place
      t.integer :user_id

      t.timestamps
    end
  end
end
