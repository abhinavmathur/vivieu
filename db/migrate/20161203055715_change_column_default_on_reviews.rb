class ChangeColumnDefaultOnReviews < ActiveRecord::Migration
  def change
    change_column_default(:reviews, :youtube_id, nil)
  end
end
