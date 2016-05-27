# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160527192800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.integer  "channel_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["channel_type_id"], name: "index_channels_on_channel_type_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fundings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_units", force: :cascade do |t|
    t.string   "name"
    t.date     "year_of_foundation"
    t.integer  "scientific_area_id"
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "funding_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["city_id"], name: "index_research_units_on_city_id", using: :btree
    t.index ["country_id"], name: "index_research_units_on_country_id", using: :btree
    t.index ["funding_id"], name: "index_research_units_on_funding_id", using: :btree
    t.index ["scientific_area_id"], name: "index_research_units_on_scientific_area_id", using: :btree
  end

  create_table "scientific_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
