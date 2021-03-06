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

ActiveRecord::Schema.define(:version => 20120816024112) do

  create_table "auctions", :force => true do |t|
    t.string   "item_id"
    t.integer  "user_id"
    t.integer  "max_bid"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.binary   "item"
    t.text     "picture"
    t.string   "auction_status"
    t.string   "user_notification", :default => "Do not notify"
    t.integer  "lead_time",         :default => 0
    t.string   "been_notified"
    t.string   "job_id"
  end

  create_table "notifications", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",                    :null => false
    t.string   "encrypted_password",     :default => "",                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "phone_number"
    t.text     "auth_token",                                                :null => false
    t.datetime "auth_token_exp",         :default => '2012-08-23 01:35:56', :null => false
    t.string   "username"
    t.string   "session_id"
    t.string   "preferred_status",       :default => "All"
    t.string   "preferred_sort",         :default => "title_asc"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
