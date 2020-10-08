class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false 

      t.string :name
      t.string :email
      t.text :address
      t.string :pay_method 

      t.timestamps
    end
  end
end
