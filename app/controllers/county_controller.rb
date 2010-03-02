class CountyController < ApplicationController
  before_filter :get_counties, :require_user
  
  def index
    @bodyid = "county"
    @pagetitle = "County level queries"
  end
  
  def ephem
    @bodyid = "county"
    @pagetitle = "Percentage of fields with ephemeral erosion"
  end
 
  def r2_crop
    @bodyid = "county"
    @pagetitle = "Average soil loss by crop type"
  end
  
  def r2_tillage
    @bodyid = "county"
    @pagetitle = "Average soil loss by tillage type"
  end
  
  def slope_crop
    @bodyid = "county"
    @pagetitle = "Fields with 12% slope by crop"
  end
  
  def slope_r2
    @bodyid = "county"
    @pagetitle = "Average soil loss for fields with 12% slope"
  end
  
  def slope_till
    @bodyid = "county"
    @pagetitle = "Fields with 12% slope by tillage"
  end

  def tillage
    @bodyid = "county"
    @pagetitle = "Percentage of fields in tillage by crop"
  end

  def tolerable
    @bodyid = "county"
    @pagetitle = "Percetage of fields meeting 'T'"
  end
  
  def remote_query
    @partial_to_load = "county/partials/"+params[:query]
    @countyName = params[:region]

    render :partial => @partial_to_load
  end
  
  def scoped_query
    @partial_to_load = "county/partials/"+params[:partial_to_load]
    
    if params[:year].to_s.downcase == "all"
      @year = @calcYear
    else
      @year = params[:year].split(',').to_a
    end
    
    @countyName = params[:countyName]

    render :partial => @partial_to_load
  end
  
  def map
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
  
private

  def get_counties
    @get_selectors = Transect.all(:select => "DISTINCT(transectCountyName)", :order => "transectCountyName ASC").map {|c| [c.transectCountyName, c.transectCountyName]}
  end


end
