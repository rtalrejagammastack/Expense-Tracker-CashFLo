class AddSlugToTransactionType < ActiveRecord::Migration[6.1]
  def change
    add_column :transaction_types, :slug, :string
    add_index :transaction_types, :slug, unique: true
  end
end
