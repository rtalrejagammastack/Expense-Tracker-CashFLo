class RemoveColumnFromExpenseSubCategories < ActiveRecord::Migration[6.1]
  def up
    remove_index :expense_sub_categories, column: [:user_category_id]
    remove_column :expense_sub_categories, :user_category_id
  end
  def down
      add_reference :expens_sub_categories, :user_category, index: true
  end
end
