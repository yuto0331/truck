class CreateBaths < ActiveRecord::Migration[5.1]
  def change
    create_table :baths do |t|
      t.integer :user_id
      t.string :name
      t.string :place
      t.string :email
      t.text :content
      t.text :image

      t.timestamps
    end
  end
end
