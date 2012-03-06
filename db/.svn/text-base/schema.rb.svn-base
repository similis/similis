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

ActiveRecord::Schema.define(:version => 20111212170122) do

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.integer  "sourceid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document",   :limit => 1000
  end

  create_table "consultations", :force => true do |t|
    t.string   "short_description"
    t.text     "description"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "consultation_date"
    t.integer  "duration"
    t.integer  "treatment_id"
    t.integer  "treatment_success"
    t.string   "treatment_description", :limit => 1000
  end

  add_index "consultations", ["customer_id"], :name => "fki_customer_id"
  add_index "consultations", ["customer_id"], :name => "index_consultations_on_customer_id"
  add_index "consultations", ["treatment_id"], :name => "fki_treatment"
  add_index "consultations", ["treatment_id"], :name => "fki_treatment_type"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "street"
    t.string   "areacode"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_image",  :limit => 1000
    t.integer  "miasmic_type_id"
  end

  add_index "customers", ["miasmic_type_id"], :name => "fki_miasmic_type_id"

  create_table "image_entries", :force => true do |t|
    t.text    "description",       :null => false
    t.string  "image",             :null => false
    t.date    "imagedate",         :null => false
    t.integer "image_gallery_id", :null => false
  end

  create_table "image_galleries", :force => true do |t|
    t.string  "name",        :null => false
    t.integer "customer_id", :null => false
  end

  add_index "image_galleries", ["customer_id"], :name => "fki_customer"

  create_table "miasmic_types", :force => true do |t|
    t.string "typename"
  end

  create_table "netzke_component_states", :force => true do |t|
    t.string   "component"
    t.integer  "user_id"
    t.integer  "role_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "netzke_component_states", ["component"], :name => "index_netzke_component_states_on_component"
  add_index "netzke_component_states", ["role_id"], :name => "index_netzke_component_states_on_role_id"
  add_index "netzke_component_states", ["user_id"], :name => "index_netzke_component_states_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "treatment_types", :force => true do |t|
    t.string "description"
  end

  create_table "treatments", :force => true do |t|
    t.string  "name"
    t.string  "potency"
    t.integer "treatment_type_id"
  end

end
