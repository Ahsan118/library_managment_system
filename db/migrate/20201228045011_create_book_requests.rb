class CreateBookRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :book_requests do |t|
      t.integer :user_id	
      t.integer :book_id
      t.integer  :status ,default: 0
      t.timestamps
    end
  end
end
