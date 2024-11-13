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

ActiveRecord::Schema[7.2].define(version: 2024_11_13_124958) do
  create_table "geolocations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.string "protocol_ip"
    t.string "continent_code"
    t.string "continent_name"
    t.string "country_code"
    t.string "country_name"
    t.string "region_code"
    t.string "region_name"
    t.string "city"
    t.string "zip"
    t.float "latitude"
    t.float "longitude"
    t.string "msa"
    t.string "dma"
    t.float "radius"
    t.string "ip_routing_type"
    t.string "connection_type"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "native"
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_languages_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "geoname_id"
    t.string "capital"
    t.string "country_flag"
    t.string "country_flag_emoji"
    t.string "country_flag_emoji_unicode"
    t.string "calling_code"
    t.boolean "is_eu"
    t.integer "geolocation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geolocation_id"], name: "index_locations_on_geolocation_id"
  end

  add_foreign_key "languages", "locations"
  add_foreign_key "locations", "geolocations"
end
