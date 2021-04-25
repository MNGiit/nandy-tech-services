class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances do |t|
      t.string :customer_name
      t.string :insurance_policy
      # t.integer :policy_number # will use db
      t.float :total_coverage_amount
      t.float :premium_amount
      t.date :due_date
      t.date :maturity_date # if team policy and due paid/not paid
      t.boolean :approval, default: false

      t.timestamps
    end
  end
end
