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

ActiveRecord::Schema[7.0].define(version: 2022_06_22_151424) do
  create_table "collections", force: :cascade do |t|
    t.string "manifest_url"
    t.string "html_url"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "image_url"
    t.integer "sort"
    t.integer "manifest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manifest_id"], name: "index_images_on_manifest_id"
  end

  create_table "manifests", force: :cascade do |t|
    t.string "label"
    t.string "manifest_url"
    t.string "html_url"
    t.integer "sort"
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_manifests_on_collection_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "images", "manifests"
  add_foreign_key "manifests", "collections"
end
