class AddIndexToTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    add_index :transaction_types, :destroyed_at
  end
end
