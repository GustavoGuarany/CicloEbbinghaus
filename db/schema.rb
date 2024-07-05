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

ActiveRecord::Schema[7.0].define(version: 2024_07_04_191308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conteudos", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.string "link"
    t.string "palavra_chave"
    t.date "primeiro_estudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "resposta"
  end

  create_table "revisoes", force: :cascade do |t|
    t.bigint "conteudo_id", null: false
    t.date "data_revisao"
    t.boolean "concluido"
    t.integer "revisoes_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conteudo_id"], name: "index_revisoes_on_conteudo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "revisoes", "conteudos"
end
