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

ActiveRecord::Schema.define(version: 20160201001322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_data", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_data", ["client_id"], name: "index_client_data_on_client_id", using: :btree
  add_index "client_data", ["key"], name: "index_client_data_on_key", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_stakeholder_attributes", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "document_stakeholder_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "document_stakeholder_attributes", ["document_stakeholder_id"], name: "doc_stake_attrs_doc_stkholder", using: :btree

  create_table "document_stakeholders", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "stakeholder_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "document_stakeholders", ["document_id"], name: "index_document_stakeholders_on_document_id", using: :btree

  create_table "document_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "view_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "document_template_id"
    t.string   "document_state"
    t.text     "document_content"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "documents", ["client_id"], name: "index_documents_on_client_id", using: :btree
  add_index "documents", ["document_template_id"], name: "index_documents_on_document_template_id", using: :btree

  add_foreign_key "client_data", "clients"
  add_foreign_key "document_stakeholder_attributes", "document_stakeholders"
  add_foreign_key "document_stakeholders", "documents"
  add_foreign_key "documents", "clients"
  add_foreign_key "documents", "document_templates"
end
