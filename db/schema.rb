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

ActiveRecord::Schema.define(version: 2021_03_12_013821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custumers", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.string "email"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.boolean "price"
    t.integer "quantity"
    t.boolean "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.boolean "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "external_code"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
