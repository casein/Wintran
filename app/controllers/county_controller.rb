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
    @pagetitle = @pagetitle = "Percetage of fields meeting 'T'"
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
  
private

  def get_counties
    @get_selectors = Transect.all(:select => "DISTINCT(transectCountyName)", :order => "transectCountyName ASC").map {|c| [c.transectCountyName, c.transectCountyName]}
  end


end
