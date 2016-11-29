class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, default: ''
      t.text :description, default: ''
      t.string :youtube_id, default: ''
      t.string :tags, default: ''
      t.string :amazon_product_title, default: ''
      t.string :amazon_product_description, default: ''
      t.string :asin, default: ''
      t.string :slug
      t.boolean :publish, default: false

      t.timestamps null: false
    end

    add_index :reviews, :title, unique: true
    add_index :reviews, :youtube_id, unique: true
    add_index :reviews, :slug, unique: true
  end
end
