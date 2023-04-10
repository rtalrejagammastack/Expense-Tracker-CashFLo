class AddSlugToTransactionStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :transaction_statuses, :slug, :string
    add_index :transaction_statuses, :slug, unique: true
  end
end
