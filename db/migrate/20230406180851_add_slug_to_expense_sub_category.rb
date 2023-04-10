class AddSlugToExpenseSubCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :expense_sub_categories, :slug, :string
    add_index :expense_sub_categories, :slug, unique: true
  end
end
