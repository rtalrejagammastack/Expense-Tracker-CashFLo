class AddDestroyedAtToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :destroyed_at, :datetime
    add_index :users, :destroyed_at
  end
end
