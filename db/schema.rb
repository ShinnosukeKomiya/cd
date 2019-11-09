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

ActiveRecord::Schema.define(version: 20191108111140) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cardnumber"
    t.string "duedate"
    t.integer "security"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "artist"
    t.integer "price"
    t.string "icon"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "created"
    t.index ["genre_id"], name: "index_cds_on_genre_id"
  end

  create_table "favs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "cd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_favs_on_cd_id"
    t.index ["user_id", "cd_id"], name: "index_favs_on_user_id_and_cd_id", unique: true
    t.index ["user_id"], name: "index_favs_on_user_id"
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quantity", default: 1, null: false
    t.bigint "cart_id", null: false
    t.bigint "cd_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["cd_id"], name: "index_line_items_on_cd_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cd_id"
    t.index ["cd_id"], name: "index_orders_on_cd_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rankings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "cd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_rankings_on_cd_id"
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "num", null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cd_id"
    t.index ["cd_id"], name: "index_stocks_on_cd_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.integer "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.boolean "deleted", default: false, null: false
    t.index ["email"], name: "email"
  end

  add_foreign_key "cards", "users"
  add_foreign_key "carts", "users"
  add_foreign_key "favs", "cds"
  add_foreign_key "favs", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "cds"
  add_foreign_key "orders", "cds"
  add_foreign_key "orders", "users"
  add_foreign_key "rankings", "cds"
  add_foreign_key "stocks", "cds"
end
