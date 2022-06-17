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

ActiveRecord::Schema[7.0].define(version: 2022_06_17_214306) do
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

  add_foreign_key "images", "manifests"
  add_foreign_key "manifests", "collections"
end
