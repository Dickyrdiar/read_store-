class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :name_store 
      t.text :desc 
      t.string :call_number

      t.timestamps
    end
  end
end
