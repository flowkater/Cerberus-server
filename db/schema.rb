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

ActiveRecord::Schema.define(:version => 20131112090437) do

  create_table "batteries", :force => true do |t|
    t.string   "report_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.float    "joule"
    t.integer  "battery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "components", ["battery_id"], :name => "index_components_on_battery_id"

  create_table "cpus", :force => true do |t|
    t.string   "report_id"
    t.string   "trace"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "eventpaths", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "tag_name"
    t.integer  "eventpath_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "events", ["eventpath_id"], :name => "index_events_on_eventpath_id"

  create_table "latency_methods", :force => true do |t|
    t.float    "latency"
    t.string   "name"
    t.string   "class_name"
    t.integer  "line_number"
    t.string   "request_url"
    t.integer  "network_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "latency_methods", ["network_id"], :name => "index_latency_methods_on_network_id"

  create_table "leak_classes", :force => true do |t|
    t.string   "classname"
    t.integer  "differencecnt"
    t.integer  "totalsize"
    t.integer  "memory_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "leak_classes", ["memory_id"], :name => "index_leak_classes_on_memory_id"

  create_table "leak_instances", :force => true do |t|
    t.string   "instancename"
    t.string   "instanceid"
    t.float    "size"
    t.float    "leak_suspect"
    t.integer  "parent_id"
    t.integer  "memory_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "leak_instances", ["memory_id"], :name => "index_leak_instances_on_memory_id"

  create_table "memories", :force => true do |t|
    t.string   "report_id"
    t.string   "hprof"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "report_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "api_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "records", :force => true do |t|
    t.string   "act_type"
    t.string   "view"
    t.string   "param"
    t.integer  "sleep"
    t.integer  "parent_id"
    t.integer  "scenario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "records", ["scenario_id"], :name => "index_records_on_scenario_id"

  create_table "reports", :force => true do |t|
    t.float    "appversion"
    t.float    "osversion"
    t.integer  "project_id",                            :null => false
    t.integer  "scenario_id"
    t.decimal  "time_for_profiling"
    t.boolean  "completed",          :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "scenarios", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "scenarios", ["project_id"], :name => "index_scenarios_on_project_id"

  create_table "trace_methods", :force => true do |t|
    t.string   "methodName"
    t.integer  "index"
    t.float    "total"
    t.float    "self"
    t.integer  "calls"
    t.float    "excl"
    t.integer  "parent_id"
    t.integer  "cpu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trace_methods", ["cpu_id"], :name => "index_trace_methods_on_cpu_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
