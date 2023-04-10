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

ActiveRecord::Schema.define(version: 2023_04_06_180851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.bigint "user_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["destroyed_at"], name: "index_expense_categories_on_destroyed_at"
    t.index ["slug"], name: "index_expense_categories_on_slug", unique: true
    t.index ["user_category_id"], name: "index_expense_categories_on_user_category_id"
  end

  create_table "expense_sub_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.bigint "category_id", null: false
    t.bigint "user_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["category_id"], name: "index_expense_sub_categories_on_category_id"
    t.index ["destroyed_at"], name: "index_expense_sub_categories_on_destroyed_at"
    t.index ["slug"], name: "index_expense_sub_categories_on_slug", unique: true
    t.index ["user_category_id"], name: "index_expense_sub_categories_on_user_category_id"
  end

  create_table "transaction_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["destroyed_at"], name: "index_transaction_modes_on_destroyed_at"
    t.index ["slug"], name: "index_transaction_modes_on_slug", unique: true
  end

  create_table "transaction_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["destroyed_at"], name: "index_transaction_statuses_on_destroyed_at"
    t.index ["slug"], name: "index_transaction_statuses_on_slug", unique: true
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "destroyed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["destroyed_at"], name: "index_transaction_types_on_destroyed_at"
    t.index ["slug"], name: "index_transaction_types_on_slug", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.text "description"
    t.string "payer_name"
    t.string "payee_name"
    t.bigint "user_category_id", null: false
    t.bigint "expense_sub_category_id", null: false
    t.bigint "status_id", null: false
    t.bigint "type_id", null: false
    t.bigint "mode_id", null: false
    t.bigint "payee_id"
    t.bigint "payer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "destroyed_at"
    t.string "slug"
    t.index ["destroyed_at"], name: "index_transactions_on_destroyed_at"
    t.bigint "payee_id", null: false
    t.bigint "payer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_sub_category_id"], name: "index_transactions_on_expense_sub_category_id"
    t.index ["mode_id"], name: "index_transactions_on_mode_id"
    t.index ["payee_id"], name: "index_transactions_on_payee_id"
    t.index ["payer_id"], name: "index_transactions_on_payer_id"
    t.index ["slug"], name: "index_transactions_on_slug", unique: true
    t.index ["status_id"], name: "index_transactions_on_status_id"
    t.index ["type_id"], name: "index_transactions_on_type_id"
    t.index ["user_category_id"], name: "index_transactions_on_user_category_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.datetime "destroyed_at"
    t.index ["destroyed_at"], name: "index_user_categories_on_destroyed_at"
    t.index ["slug"], name: "index_user_categories_on_slug", unique: true
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "phone_number"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "destroyed_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["destroyed_at"], name: "index_users_on_destroyed_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "expense_categories", "user_categories"
  add_foreign_key "expense_sub_categories", "expense_categories", column: "category_id"
  add_foreign_key "expense_sub_categories", "user_categories"
  add_foreign_key "transactions", "expense_sub_categories"
  add_foreign_key "transactions", "transaction_modes", column: "mode_id"
  add_foreign_key "transactions", "transaction_statuses", column: "status_id"
  add_foreign_key "transactions", "transaction_types", column: "type_id"
  add_foreign_key "transactions", "user_categories"
  add_foreign_key "transactions", "users", column: "payee_id"
  add_foreign_key "transactions", "users", column: "payer_id"
  add_foreign_key "user_categories", "users"
end
