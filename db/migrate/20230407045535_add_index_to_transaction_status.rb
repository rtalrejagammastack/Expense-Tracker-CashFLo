class AddIndexToTransactionStatus < ActiveRecord::Migration[6.1]
  def change
    add_index :transaction_statuses, :destroyed_at
  end
end
