class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :item, default: ''
      t.text :description, default: ''
      t.references :review, index: true, foreign_key: true
      t.boolean :header, default: false

      t.timestamps null: false
    end
  end
end
