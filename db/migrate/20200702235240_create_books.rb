class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: false do |t|
      t.binary :id, limit: 36, primary_key: true, :null => false

      t.string :name_book
      t.text :desc 
      t.string :date_of_issue 
      t.string :page
      t.string :ISBN

      t.timestamps
    end
  end
end
