class RemoveEmailFromBaths < ActiveRecord::Migration[5.1]
  def change
    remove_column :baths, :email, :string
  end
end
