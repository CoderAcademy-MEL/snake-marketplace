class AddUserRefToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :user, null: false, foreign_key: true
  end
end
