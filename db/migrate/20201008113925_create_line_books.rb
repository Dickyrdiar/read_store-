class CreateLineBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :line_books,  id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false 

      t.integer :book_id
      t.integer :cart_id
      t.integer :order_id

      t.timestamps
    end
  end
end
