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

ActiveRecord::Schema.define(version: 20140806144908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "results", force: true do |t|
    t.string   "benchmark"
    t.decimal  "score",      default: 0.0
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["run_id"], name: "index_results_on_run_id", using: :btree

  create_table "runners", force: true do |t|
    t.string   "name"
    t.string   "hardware"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "runners", ["name"], name: "index_runners_on_name", unique: true, using: :btree
  add_index "runners", ["token"], name: "index_runners_on_token", unique: true, using: :btree

  create_table "runs", force: true do |t|
    t.string   "ruby_version"
    t.string   "git_hash"
    t.datetime "date"
    t.integer  "runner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rails_version"
    t.string   "rails_git_hash"
  end

  add_index "runs", ["runner_id"], name: "index_runs_on_runner_id", using: :btree

end
