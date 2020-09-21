class CreateLaunches < ActiveRecord::Migration[6.0]
  def change
    create_table :launches, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :name_book
      t.text :desc 
      t.string :author
      t.string :date_of_launch 
      t.decimal :page
      t.decimal :ISBN
      t.decimal :price
      t.attachment :image

      t.timestamps
    end
  end
end
