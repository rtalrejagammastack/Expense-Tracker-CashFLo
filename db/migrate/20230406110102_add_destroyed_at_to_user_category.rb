class AddDestroyedAtToUserCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :user_categories, :destroyed_at, :datetime
    add_index :user_categories, :destroyed_at
  end
end
