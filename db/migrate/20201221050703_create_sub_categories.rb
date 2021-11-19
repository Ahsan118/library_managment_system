class CreateSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_categories do |t|
    	t.string :subcat
    	t.string :status
    	t.references :category
      t.timestamps
    end
  end
end
