class WatershedController < ApplicationController
  before_filter :get_watersheds, :require_user

  def index
    @bodyid = "watershed"
    @pagetitle = "Watershed level queries"
  end
  
  def ephem
    @bodyid = "watershed"
    @pagetitle = "Percentage of fields with ephemeral erosion"
  end
  
  
  def remote_query
    @partial_to_load = "watershed/partials/"+params[:query]
    @shedName = params[:region]

    render :partial => @partial_to_load
  end
  
  
  private
  
  def get_watersheds
    @get_selectors = Point.all(:conditions => ['pointWatershedName != ?', "missing"], :select => "DISTINCT(pointWatershedName)", :order => "pointWatershedName ASC").map {|w| [w.pointWatershedName, w.pointWatershedName]}
  end

end
