class AddIndexToTransactionMode < ActiveRecord::Migration[6.1]
  def change
    add_index :transaction_modes, :destroyed_at
  end
end
