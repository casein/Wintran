# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090921155457) do

  create_table "points", :force => true do |t|
    t.string  "transect_id",           :limit => 50,  :default => "", :null => false
    t.string  "route_stop_id",         :limit => 50,  :default => "", :null => false
    t.integer "pointPosition",                        :default => 0,  :null => false
    t.integer "pointActive",                          :default => 0,  :null => false
    t.string  "pointLocDesc",          :limit => 120
    t.string  "pointXCoord",           :limit => 50
    t.string  "pointYCoord",           :limit => 50
    t.string  "pointZCoord",           :limit => 50
    t.string  "pointSoilSymbol",       :limit => 50
    t.string  "pointSoilName",         :limit => 50
    t.float   "pointSlope"
    t.float   "pointSlopeLength"
    t.float   "pointTFactor"
    t.float   "pointKFactor"
    t.string  "pointWatershedNum",     :limit => 50
    t.string  "pointWatershedHUCCode", :limit => 50
    t.string  "pointWatershedName",    :limit => 100
    t.float   "pointFieldSize"
  end

  add_index "points", ["pointActive"], :name => "point_active"
  add_index "points", ["pointSlope"], :name => "point_slope"

  create_table "route_stops", :force => true do |t|
    t.string "transect_id",     :limit => 50, :default => "", :null => false
    t.string "routestopNumber", :limit => 50, :default => "", :null => false
    t.float  "routestopValue"
    t.string "routestopXCoord", :limit => 50
    t.string "routestopYCoord", :limit => 50
    t.string "routestopZCoord", :limit => 50
  end

  create_table "seasons", :id => false, :force => true do |t|
    t.string  "transect_id",                :limit => 50,  :default => "", :null => false
    t.string  "route_stop_id",              :limit => 50,  :default => "", :null => false
    t.string  "point_id",                   :limit => 50,  :default => "", :null => false
    t.integer "seasonYear",                                :default => 0,  :null => false
    t.string  "seasonCrop",                 :limit => 120
    t.string  "seasonTillage",              :limit => 120
    t.integer "seasonContouring"
    t.integer "seasonFilterstrip"
    t.integer "seasonEphemErosion"
    t.float   "seasonResidue"
    t.integer "seasonPFactor"
    t.float   "seasonR2SingleYearSoilLoss"
    t.float   "seasonR2MultiYearSoilLoss"
  end

  add_index "seasons", ["seasonCrop"], :name => "season_crop"
  add_index "seasons", ["seasonTillage"], :name => "season_tillage"
  add_index "seasons", ["seasonYear"], :name => "season_year"

  create_table "transects", :force => true do |t|
    t.string  "transectRouteName",      :limit => 50
    t.integer "transectStateNum"
    t.string  "transectStateName",      :limit => 50
    t.integer "transectCountyNum"
    t.string  "transectCountyName",     :limit => 50
    t.integer "transectCountyAcreage"
    t.string  "transectGPSUnits",       :limit => 50
    t.string  "transectGPSCoords",      :limit => 50
    t.string  "transectNotes",          :limit => 250
    t.integer "transectYearsInAveR2"
    t.integer "transectStartYearAveR2"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
