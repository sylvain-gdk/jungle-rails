class AddForeignKeysReviews < ActiveRecord::Migration
  def change
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :products
  end
end
