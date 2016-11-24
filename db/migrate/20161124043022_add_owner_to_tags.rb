class AddOwnerToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :owner, index: true
    add_foreign_key :tags, :users, column: :owner_id
  end
end
