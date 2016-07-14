class AddReferencesToStore < ActiveRecord::Migration
  def change
    add_reference :stores, :store_category, index: true, foreign_key: true
  end
end
