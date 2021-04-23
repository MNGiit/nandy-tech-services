class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances do |t|
      t.string :customer_name
      t.string :loan_type
      # t.integer :loan_number # will use db
      t.float :loan_amount
      t.float :pending_principle_amount
      t.float :interest_rate
      t.date :due_date
      t.boolean :loan_closed #

      t.timestamps
    end
  end
end

# customer name
# loan type
# loan number
# loan amount
# due date
# interest rate
# pending principle amount
# loan closed/not
