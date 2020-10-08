class AddReviewIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :book_id, :string 
    add_index :reviews, :book_id
  end
end
