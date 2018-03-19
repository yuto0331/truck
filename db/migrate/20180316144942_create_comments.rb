class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.string :menu
      t.string :comment
      t.string :takeout
      t.text :image

      t.timestamps
    end
  end
end
