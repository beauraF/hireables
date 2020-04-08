# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_08_224938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.bigint "external_id", null: false
    t.string "username", null: false
    t.string "name"
    t.text "bio"
    t.string "company"
    t.string "location"
    t.string "email"
    t.string "blog"
    t.boolean "hireable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_id"], name: "index_developers_on_external_id", unique: true
    t.index ["username"], name: "index_developers_on_username", unique: true
  end

  create_table "exports", force: :cascade do |t|
    t.string "status", default: "pending", null: false
    t.uuid "uuid", null: false
    t.string "email", null: false
    t.string "location"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
