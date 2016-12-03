class AddCategoryToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :category, index: true, foreign_key: true
  end
end
