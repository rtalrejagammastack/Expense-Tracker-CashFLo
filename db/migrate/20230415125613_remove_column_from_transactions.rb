class RemoveColumnFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_index :transactions, column: [:payer_id]
    remove_column :transactions, :payer_id
    remove_index :transactions, column: [:payee_id]
    remove_column :transactions, :payee_id
    add_reference :transactions, :user, foreign_key: true
  end
end
