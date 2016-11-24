class RemoveOwnerFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :owner, :integer
  end
end
