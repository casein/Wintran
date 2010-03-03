class MapController < ApplicationController
  #before_filter :require_user
  
    def index
      #page info
      @pagetitle = "map"
      @bodyid = "map"
      #map setup
      @map = GMap.new("map_div")
      @map.control_init(:large_map => true, :map_type => true)
      @map.center_zoom_init([43.388957,-88.252144],10)
      #map attributes
      @pPoints = Map.active.coordinates
      @pArray = @pPoints.inject([]) {|result, element| result.push([element.xCoord, element.yCoord])}
  #    mInterp = GMarker.new([@pArray[0]], :title => "hello2", :info_window => "hola")
  #    mHard = GMarker.new([43.300000,-88.300000], :title => "hello", :info_window => "43.388957,-88.252144")
  #    @map.overlay_init(mInterp)
  #    @map.overlay_init(mHard)
    end
  
end
