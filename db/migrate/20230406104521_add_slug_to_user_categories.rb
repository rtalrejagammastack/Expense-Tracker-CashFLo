class AddSlugToUserCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :user_categories, :slug, :string
    add_index :user_categories, :slug, unique: true
  end
end
