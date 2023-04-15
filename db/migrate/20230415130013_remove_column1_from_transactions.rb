class RemoveColumn1FromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_index :transactions, column: [:user_id]
    remove_column :transactions, :user_id
  end
end
