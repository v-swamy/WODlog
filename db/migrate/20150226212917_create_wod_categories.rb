class CreateWodCategories < ActiveRecord::Migration
  def change
    create_table :wod_categories do |t|
      t.integer :wod_id
      t.integer :category_id
      t.timestamps
    end
  end
end
