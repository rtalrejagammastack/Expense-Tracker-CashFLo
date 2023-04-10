class AddIndexToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :destroyed_at, :datetime
    add_index :transactions, :destroyed_at
  end
end
