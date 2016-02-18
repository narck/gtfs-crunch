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

ActiveRecord::Schema.define(version: 20160218081648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: true do |t|
    t.integer  "agency_id"
    t.string   "agency_name"
    t.string   "agency_url"
    t.string   "agency_timezone"
    t.string   "agency_lang"
    t.string   "agency_phone"
    t.string   "agency_fare_url"
    t.string   "agency_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_dates", force: true do |t|
    t.integer  "service_id"
    t.date     "date"
    t.integer  "exception_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", force: true do |t|
    t.integer  "service_id"
    t.integer  "monday"
    t.integer  "tuesday"
    t.integer  "wednesday"
    t.integer  "thursday"
    t.integer  "friday"
    t.integer  "saturday"
    t.integer  "sunday"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fare_attributes", force: true do |t|
    t.integer  "fare_id"
    t.float    "price"
    t.string   "currency_type"
    t.integer  "payment_method"
    t.integer  "transfers"
    t.float    "transfer_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_infos", force: true do |t|
    t.string   "feed_publisher_name"
    t.string   "feed_publisher_url"
    t.string   "feed_lang"
    t.date     "feed_start_date"
    t.date     "feed_end_date"
    t.string   "feed_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gtfs_settings", force: true do |t|
    t.string   "latest_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.integer  "route_id"
    t.integer  "agency_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.string   "route_desc"
    t.integer  "route_type"
    t.string   "route_url"
    t.string   "route_text_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shapes", force: true do |t|
    t.integer  "shape_id"
    t.float    "shape_pt_lat"
    t.float    "shape_pt_lon"
    t.integer  "shape_pt_sequence"
    t.float    "shape_dist_traveled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stop_times", force: true do |t|
    t.integer  "trip_id"
    t.time     "arrival_time"
    t.time     "departure_time"
    t.integer  "stop_id"
    t.integer  "stop_sequence"
    t.string   "stop_headsign"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.float    "shape_dist_traveled"
    t.integer  "timepoint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", force: true do |t|
    t.integer  "stop_id"
    t.string   "stop_code"
    t.string   "stop_name"
    t.string   "stop_desc"
    t.string   "stop_lat"
    t.string   "stop_lon"
    t.integer  "zone_id"
    t.string   "stop_url"
    t.integer  "location_type"
    t.integer  "parent_station"
    t.string   "stop_timezone"
    t.integer  "wheelchair_boarding"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "route_id"
    t.integer  "service_id"
    t.integer  "trip_id"
    t.string   "trip_headsign"
    t.string   "trip_short_name"
    t.integer  "direction_id"
    t.integer  "block_id"
    t.integer  "shape_id"
    t.integer  "wheelchair_accessible"
    t.integer  "bikes_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
