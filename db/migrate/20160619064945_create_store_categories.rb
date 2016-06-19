class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
