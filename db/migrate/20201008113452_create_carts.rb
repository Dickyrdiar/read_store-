class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts,  id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.timestamps
    end
  end
end
