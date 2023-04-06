class AddSlugToExpenseCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :expense_categories, :slug, :string
    add_index :expense_categories, :slug, unique: true
  end
end
