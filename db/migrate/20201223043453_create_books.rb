class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
    	t.string :book_title
    	t.string :status
    	t.references :sub_category
      t.timestamps
    end
  end
end
