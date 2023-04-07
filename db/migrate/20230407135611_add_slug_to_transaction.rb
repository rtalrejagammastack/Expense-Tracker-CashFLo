class AddSlugToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :slug, :string
    add_index :transactions, :slug, unique: true
  end
end
