class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title, default: ''
      t.integer :views, default: 0
      t.integer :owner
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
