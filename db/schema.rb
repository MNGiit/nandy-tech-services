# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_23_051034) do

  create_table "insurances", force: :cascade do |t|
    t.string "customer_name"
    t.string "loan_type"
    t.float "loan_amount"
    t.float "pending_principle_amount"
    t.float "interest_rate"
    t.date "due_date"
    t.boolean "loan_closed"
    t.boolean "approval", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.string "customer_name"
    t.string "insurance_policy"
    t.float "total_coverage_amount"
    t.float "premium_amount"
    t.date "due_date"
    t.date "maturity_date"
    t.boolean "approval", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "isAdmin"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
