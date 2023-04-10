class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.text :description
      t.string :payer_name
      t.string :payee_name
      t.references :user_category, null: false, foreign_key: true
      t.references :expense_sub_category, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: { to_table: :transaction_statuses }
      t.references :type, null: false, foreign_key: { to_table: :transaction_types }
      t.references :mode, null: false, foreign_key: { to_table: :transaction_modes }
      t.references :payee, null: false, foreign_key: { to_table: :users }
      t.references :payer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
