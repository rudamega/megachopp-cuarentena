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

ActiveRecord::Schema.define(version: 2020_09_21_122958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.string "status"
    t.string "quantity"
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_id", null: false
    t.integer "price"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "status", default: "open"
    t.date "date"
    t.string "cliente"
    t.string "razon_social"
    t.string "ruc"
    t.string "email"
    t.string "tel"
    t.string "lugar"
    t.string "obs"
    t.string "sena"
    t.string "latitud"
    t.string "longitud"
    t.string "factura"
    t.string "ciudad"
    t.string "zona"
    t.string "show", default: "no"
    t.bigint "cliente_id"
    t.index ["cliente_id"], name: "index_carts_on_cliente_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "name"
    t.string "razon_social"
    t.string "tel"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ruc"
    t.date "date"
  end

  create_table "facturas", force: :cascade do |t|
    t.string "nro"
    t.string "razon_social"
    t.string "ruc"
    t.string "email"
    t.string "condicion"
    t.bigint "user_id", null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_id", null: false
    t.integer "total"
    t.date "date"
    t.integer "pagado"
    t.integer "saldo"
    t.index ["cart_id"], name: "index_facturas_on_cart_id"
    t.index ["cliente_id"], name: "index_facturas_on_cliente_id"
    t.index ["user_id"], name: "index_facturas_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "cost_price"
    t.integer "sales_prices"
    t.integer "stock", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mov_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "item_id", null: false
    t.bigint "factura_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.integer "costo"
    t.integer "precio"
    t.index ["factura_id"], name: "index_mov_items_on_factura_id"
    t.index ["item_id"], name: "index_mov_items_on_item_id"
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string "name"
    t.string "latitud"
    t.string "longitud"
    t.string "obs"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ciudad"
    t.string "zona"
    t.string "link"
    t.index ["cliente_id"], name: "index_ubicacions_on_cliente_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "ruc"
    t.string "phone_number"
    t.date "data"
    t.string "admin", default: "cliente"
    t.string "rol", default: "cliente"
    t.string "razon_social"
    t.string "lugar"
    t.string "latitud"
    t.string "longitud"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "carts", "clientes"
  add_foreign_key "carts", "users"
  add_foreign_key "facturas", "carts"
  add_foreign_key "facturas", "clientes"
  add_foreign_key "facturas", "users"
  add_foreign_key "mov_items", "facturas"
  add_foreign_key "mov_items", "items"
  add_foreign_key "ubicacions", "clientes"
end
