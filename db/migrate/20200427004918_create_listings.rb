class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.references :breed, null: false, foreign_key: true
      t.integer :sex
      t.integer :price
      t.integer :deposit
      t.string :city
      t.string :state
      t.date :date_of_birth
      t.string :diet

      t.timestamps
    end
  end
end
