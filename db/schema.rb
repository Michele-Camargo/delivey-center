# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_12_004316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchases", force: :cascade do |t|
    t.integer "external_code_purchase"
    t.integer "store"
    t.string "sub_total"
    t.string "delivery_fee"
    t.integer "total_shipping"
    t.string "total"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "complement"
    t.datetime "dt_order_create"
    t.string "postal_code"
    t.string "number"
    t.string "external_code_customer"
    t.string "customer_name"
    t.string "customer_email"
    t.string "customer_contact"
    t.string "external_code_item"
    t.string "item_name"
    t.boolean "item_price"
    t.integer "item_quantity"
    t.boolean "item_total"
    t.string "payment_type"
    t.boolean "paymant_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
