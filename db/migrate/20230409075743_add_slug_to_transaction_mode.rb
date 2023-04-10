class AddSlugToTransactionMode < ActiveRecord::Migration[6.1]
  def change
    add_column :transaction_modes, :slug, :string
    add_index :transaction_modes, :slug, unique: true
  end
end
