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

ActiveRecord::Schema.define(version: 2021_02_03_201827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.integer "price"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tv_series", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.integer "price"
    t.string "season"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venta", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id"
    t.bigint "tv_serie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_venta_on_movie_id"
    t.index ["tv_serie_id"], name: "index_venta_on_tv_serie_id"
    t.index ["user_id"], name: "index_venta_on_user_id"
  end

  create_table "venta_movies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_venta_movies_on_movie_id"
    t.index ["user_id"], name: "index_venta_movies_on_user_id"
  end

  create_table "venta_tv_series", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tv_serie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tv_serie_id"], name: "index_venta_tv_series_on_tv_serie_id"
    t.index ["user_id"], name: "index_venta_tv_series_on_user_id"
  end

  add_foreign_key "venta", "movies"
  add_foreign_key "venta", "tv_series", column: "tv_serie_id"
  add_foreign_key "venta", "users"
  add_foreign_key "venta_movies", "movies"
  add_foreign_key "venta_movies", "users"
  add_foreign_key "venta_tv_series", "tv_series", column: "tv_serie_id"
  add_foreign_key "venta_tv_series", "users"
end
