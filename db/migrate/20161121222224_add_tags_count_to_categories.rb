class AddTagsCountToCategories < ActiveRecord::Migration

  def self.up

    add_column :categories, :tags_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :categories, :tags_count

  end

end
