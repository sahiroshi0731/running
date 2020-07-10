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

ActiveRecord::Schema.define(version: 2020_07_08_113330) do

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname"
    t.string "maintitle"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "enrollment", null: false
    t.string "sex"
    t.integer "age", limit: 1
    t.integer "fullhour", limit: 1
    t.integer "fullmin", limit: 1
    t.integer "fullsec", limit: 1
    t.integer "halfhour", limit: 1
    t.integer "halfmin", limit: 1
    t.integer "halfsec", limit: 1
    t.string "comment"
    t.date "achievementymd"
    t.integer "bestfullhour", limit: 1
    t.integer "bestfullmin", limit: 1
    t.integer "bestfullsec", limit: 1
    t.integer "besthalfhour", limit: 1
    t.integer "besthalfmin", limit: 1
    t.integer "besthalfsec", limit: 1
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "run_day"
    t.string "run_title"
    t.text "run_article"
    t.decimal "run_distance", precision: 6, scale: 3
    t.time "run_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "hour", limit: 1
    t.integer "min", limit: 1
    t.integer "sec", limit: 1
    t.boolean "raceflg", default: false, null: false
    t.string "competition"
    t.index ["user_id"], name: "index_records_on_user_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "targets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "target_ym"
    t.string "target_declaration"
    t.decimal "target_distance", precision: 6, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
