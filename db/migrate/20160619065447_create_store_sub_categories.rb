class CreateStoreSubCategories < ActiveRecord::Migration
  def change
    create_table :store_sub_categories do |t|
      t.string :subcategory
      t.references :store_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
