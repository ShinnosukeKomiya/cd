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

ActiveRecord::Schema.define(version: 20191031070829) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cardnumber"
    t.string "duedate"
    t.integer "security"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "cartitems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quantity"
    t.integer "price"
    t.bigint "cd_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_cartitems_on_cd_id"
    t.index ["order_id"], name: "index_cartitems_on_order_id"
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
    t.index ["user_id"], name: "index_favs_on_user_id"
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "total"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rankings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count"
    t.bigint "fav_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fav_id"], name: "index_rankings_on_fav_id"
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stock"
    t.bigint "cd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_stocks_on_cd_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "address"
    t.integer "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "email"
  end

  add_foreign_key "cards", "users"
  add_foreign_key "cartitems", "cds"
  add_foreign_key "cartitems", "orders"
  add_foreign_key "favs", "cds"
  add_foreign_key "favs", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "rankings", "favs"
  add_foreign_key "stocks", "cds"
end
