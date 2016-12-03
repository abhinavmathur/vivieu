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

ActiveRecord::Schema.define(version: 20161201010412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliate_countries", force: :cascade do |t|
    t.string   "country",               default: ""
    t.string   "default_affiliate_tag", default: ""
    t.string   "tracker",               default: ""
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "affiliate_countries", ["user_id"], name: "index_affiliate_countries_on_user_id", using: :btree

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.json     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["name", "time"], name: "index_ahoy_events_on_name_and_time", using: :btree
  add_index "ahoy_events", ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name", using: :btree
  add_index "ahoy_events", ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name", using: :btree

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.integer  "views",       default: 0
    t.string   "slug"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "tags_count",  default: 0,  null: false
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  add_index "categories", ["title"], name: "index_categories_on_title", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title",                      default: ""
    t.text     "description",                default: ""
    t.string   "youtube_id",                 default: ""
    t.string   "tags",                       default: ""
    t.string   "amazon_product_title",       default: ""
    t.string   "amazon_product_description", default: ""
    t.string   "asin",                       default: ""
    t.string   "slug"
    t.boolean  "publish",                    default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "reviewer_id"
    t.integer  "category_id"
  end

  add_index "reviews", ["category_id"], name: "index_reviews_on_category_id", using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree
  add_index "reviews", ["slug"], name: "index_reviews_on_slug", unique: true, using: :btree
  add_index "reviews", ["title"], name: "index_reviews_on_title", unique: true, using: :btree
  add_index "reviews", ["youtube_id"], name: "index_reviews_on_youtube_id", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",       default: ""
    t.integer  "views",       default: 0
    t.integer  "category_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "owner_id"
  end

  add_index "tags", ["category_id"], name: "index_tags_on_category_id", using: :btree
  add_index "tags", ["owner_id"], name: "index_tags_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "vivieu_name",            default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.text     "description",            default: ""
    t.string   "facebook",               default: ""
    t.string   "twitter",                default: ""
    t.string   "patreon",                default: ""
    t.string   "google_plus",            default: ""
    t.string   "personal_website",       default: ""
    t.string   "uid",                    default: ""
    t.string   "avatar",                 default: ""
    t.string   "token",                  default: ""
    t.string   "refresh_token",          default: ""
    t.string   "locale",                 default: "en"
    t.boolean  "admin",                  default: false
    t.boolean  "reviewer",               default: false
    t.boolean  "toc",                    default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["vivieu_name"], name: "index_users_on_vivieu_name", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree

  add_foreign_key "affiliate_countries", "users"
  add_foreign_key "reviews", "categories"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "tags", "categories"
  add_foreign_key "tags", "users", column: "owner_id"
end
