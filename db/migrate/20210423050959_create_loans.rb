class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :customer_name
      t.string :loan_type
      # t.integer :loan_number # will use db
      t.float :loan_amount
      t.float :pending_principle_amount
      t.float :interest_rate
      t.date :due_date
      t.boolean :loan_closed #
      t.boolean :approval, default: false

      t.timestamps
    end
  end
end
