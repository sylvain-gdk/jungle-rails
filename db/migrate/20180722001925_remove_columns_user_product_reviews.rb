class RemoveColumnsUserProductReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :users_id
    remove_column :reviews, :products_id
    remove_column :users, :reviews_id
  end
end
