class AddIndexToExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    add_index :expense_categories, :destroyed_at
  end
end
