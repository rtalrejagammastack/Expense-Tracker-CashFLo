class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
