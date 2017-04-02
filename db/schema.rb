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

ActiveRecord::Schema.define(version: 20170402010050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name_country"
    t.string   "initials"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name_location"
    t.integer  "country_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "countries_id"
    t.index ["countries_id"], name: "index_locations_on_countries_id", using: :btree
  end

  create_table "temperatures", force: :cascade do |t|
    t.decimal  "temperature"
    t.integer  "location_id"
    t.integer  "generated_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "locations_id"
    t.index ["locations_id"], name: "index_temperatures_on_locations_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.text     "password"
    t.text     "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "locations", "countries", column: "countries_id"
  add_foreign_key "temperatures", "locations", column: "locations_id"
end
