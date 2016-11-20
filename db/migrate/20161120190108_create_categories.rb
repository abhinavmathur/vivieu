class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, default: ''
      t.text :description, default: ''
      t.integer :views, default: 0
      t.string :slug

      t.timestamps null: false
    end

    add_index :categories, :title, unique: true
    add_index :categories, :slug, unique: true
  end
end
