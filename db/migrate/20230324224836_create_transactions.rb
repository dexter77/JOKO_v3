class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_account_number
      t.integer :receiver_account_number
      t.string :amount
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :status


      t.timestamps
    end
  end
end
