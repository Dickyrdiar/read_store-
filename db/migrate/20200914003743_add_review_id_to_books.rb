class AddReviewIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :review, :text
  end
end
