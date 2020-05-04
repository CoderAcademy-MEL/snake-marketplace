class CreateCartListings < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_listings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
