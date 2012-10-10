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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120924051732) do

  create_table "holidays", :force => true do |t|
    t.date     "date"
    t.string   "event"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leaves", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "no_of_days"
    t.string   "current_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "reason"
    t.datetime "approved_on"
    t.string   "rejection_reason"
    t.integer  "approved_by"
  end

  add_index "leaves", ["user_id"], :name => "index_leaves_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "setups", :force => true do |t|
    t.integer  "total_leaves"
    t.integer  "year"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",           :null => false
    t.string   "encrypted_password",                    :default => "",           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "role",                                  :default => "employee"
    t.string   "name"
    t.float    "total_leaves"
    t.date     "joining_date",                          :default => '2012-01-01'
    t.integer  "manager_id"
    t.integer  "phone_number",             :limit => 8
    t.integer  "emergency_phone_number",   :limit => 8
    t.string   "emergency_contact_person"
    t.integer  "alternate_phone_number",   :limit => 8
    t.string   "blood_group"
    t.string   "official_email_id"
    t.string   "alternate_email_id"
    t.date     "date_of_birth"
    t.string   "local_address"
    t.string   "permanent_address"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
