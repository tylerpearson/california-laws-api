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

ActiveRecord::Schema.define(version: 20150709051549) do

  create_table "codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code",  limit: 5,    collation: "utf8_bin"
    t.string "title", limit: 2000, collation: "utf8_bin"
  end

  create_table "law_section", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                     limit: 100,                      collation: "utf8_bin"
    t.string   "law_code",               limit: 5,                        collation: "utf8_bin"
    t.string   "section_num",            limit: 30,                       collation: "utf8_bin"
    t.string   "op_statues",             limit: 10,                       collation: "utf8_bin"
    t.string   "op_chapter",             limit: 10,                       collation: "utf8_bin"
    t.string   "op_section",             limit: 20,                       collation: "utf8_bin"
    t.datetime "effective_date"
    t.string   "law_section_version_id", limit: 100,                      collation: "utf8_bin"
    t.string   "division",               limit: 100,                      collation: "utf8_bin"
    t.string   "title",                  limit: 100,                      collation: "utf8_bin"
    t.string   "part",                   limit: 100,                      collation: "utf8_bin"
    t.string   "chapter",                limit: 100,                      collation: "utf8_bin"
    t.string   "article",                limit: 100,                      collation: "utf8_bin"
    t.string   "history",                limit: 1000,                     collation: "utf8_bin"
    t.text     "content_xml",            limit: 4294967295,               collation: "utf8_bin"
    t.string   "active_flg",             limit: 1,          default: "Y", collation: "utf8_bin"
    t.string   "trans_uid",              limit: 30,                       collation: "utf8_bin"
    t.datetime "trans_update"
    t.index ["id"], name: "law_section_tbl_pk", using: :btree
    t.index ["law_code"], name: "law_section_code_idx", using: :btree
    t.index ["law_section_version_id"], name: "law_section_id_idx", using: :btree
    t.index ["section_num"], name: "law_section_sect_idx", using: :btree
  end

  create_table "law_toc", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "law_code",              limit: 5,                                 collation: "utf8_bin"
    t.string   "division",              limit: 100,                               collation: "utf8_bin"
    t.string   "title",                 limit: 100,                               collation: "utf8_bin"
    t.string   "part",                  limit: 100,                               collation: "utf8_bin"
    t.string   "chapter",               limit: 100,                               collation: "utf8_bin"
    t.string   "article",               limit: 100,                               collation: "utf8_bin"
    t.string   "heading",               limit: 2000,                              collation: "utf8_bin"
    t.string   "active_flg",            limit: 1,                   default: "Y", collation: "utf8_bin"
    t.string   "trans_uid",             limit: 30,                                collation: "utf8_bin"
    t.datetime "trans_update"
    t.decimal  "node_sequence",                      precision: 22
    t.decimal  "node_level",                         precision: 22
    t.decimal  "node_position",                      precision: 22
    t.string   "node_treepath",         limit: 100,                               collation: "utf8_bin"
    t.string   "contains_law_sections", limit: 1,                                 collation: "utf8_bin"
    t.string   "history_note",          limit: 350,                               collation: "utf8_bin"
    t.string   "op_statues",            limit: 10,                                collation: "utf8_bin"
    t.string   "op_chapter",            limit: 10,                                collation: "utf8_bin"
    t.string   "op_section",            limit: 20,                                collation: "utf8_bin"
    t.index ["article"], name: "law_toc_article_idx", using: :btree
    t.index ["chapter"], name: "law_toc_chapter_idx", using: :btree
    t.index ["division"], name: "law_toc_division_idx", using: :btree
    t.index ["law_code"], name: "law_toc_code_idx", using: :btree
    t.index ["part"], name: "law_toc_part_idx", using: :btree
    t.index ["title"], name: "law_toc_title_idx", using: :btree
  end

  create_table "law_toc_sections", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                     limit: 100,                collation: "utf8_bin"
    t.string   "law_code",               limit: 5,                  collation: "utf8_bin"
    t.string   "node_treepath",          limit: 100,                collation: "utf8_bin"
    t.string   "section_num",            limit: 30,                 collation: "utf8_bin"
    t.decimal  "section_order",                      precision: 22
    t.string   "title",                  limit: 400,                collation: "utf8_bin"
    t.string   "op_statues",             limit: 10,                 collation: "utf8_bin"
    t.string   "op_chapter",             limit: 10,                 collation: "utf8_bin"
    t.string   "op_section",             limit: 20,                 collation: "utf8_bin"
    t.string   "trans_uid",              limit: 30,                 collation: "utf8_bin"
    t.datetime "trans_update"
    t.string   "law_section_version_id", limit: 100,                collation: "utf8_bin"
    t.decimal  "seq_num",                            precision: 22
    t.index ["law_code", "node_treepath"], name: "law_toc_sections_node_idx", using: :btree
  end

end
