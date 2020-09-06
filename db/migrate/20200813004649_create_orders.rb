class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.integer :book_id 
      t.integer :user_id
      t.integer :total 

      t.timestamps
    end
    add_index :orders, [:book_id, :user_id]
  end
end
