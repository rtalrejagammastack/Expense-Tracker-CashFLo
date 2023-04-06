class CreateExpenseSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_sub_categories do |t|
      t.string :name
      t.datetime :destroyed_at
      t.references :category, null: false, foreign_key: { to_table: :expense_categories }
      t.references :user_category, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
