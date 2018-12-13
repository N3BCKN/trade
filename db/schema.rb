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

ActiveRecord::Schema.define(version: 2018_12_13_132108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text "address"
    t.string "city"
    t.string "zip_code"
    t.string "country"
    t.string "phone_number"
    t.string "email"
    t.string "home_page"
    t.text "company_description"
    t.integer "year_of_establishment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "favorite_leads", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_favorite_leads_on_lead_id"
    t.index ["user_id"], name: "index_favorite_leads_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "title"
    t.string "lead_status"
    t.text "description"
    t.string "contact_person"
    t.text "address"
    t.string "city"
    t.string "zip_code"
    t.string "country"
    t.string "phone_number"
    t.string "email"
    t.string "home_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.string "product_image_file_name"
    t.string "product_image_content_type"
    t.integer "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.text "description_short"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_leads_on_category_id"
    t.index ["deleted_at"], name: "index_leads_on_deleted_at"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "email"
    t.string "contact_person"
    t.string "country"
    t.string "phone_number"
    t.bigint "lead_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_messages_on_lead_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.datetime "deleted_at"
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "favorite_leads", "leads"
  add_foreign_key "favorite_leads", "users"
  add_foreign_key "leads", "categories"
  add_foreign_key "leads", "users"
  add_foreign_key "messages", "leads"
  add_foreign_key "messages", "users"
end
