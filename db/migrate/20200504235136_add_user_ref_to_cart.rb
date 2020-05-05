class AddUserRefToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :user, null: false, foreign_key: true
  end
end
