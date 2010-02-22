class StateController < ApplicationController

  before_filter :require_user, :get_counties
  
    def index
      @bodyid = "state"
      @pagetitle = "State level queries"      
    end
  
    def ephem
      @bodyid = "state"
      @pagetitle = "Percentage of fields with ephemeral erosion"
    end
   
    def r2_crop
      @bodyid = "state"
      @pagetitle = "Average soil loss by crop type"
    end
    
    def r2_tillage
      @bodyid = "state"
      @pagetitle = "Average soil loss by tillage type"
    end
    
    def slope_crop
      @bodyid = "state"
      @pagetitle = "Fields with 12% slope by crop"
    end
    
    def slope_r2
      @bodyid = "state"
      @pagetitle = "Average soil loss for fields with 12% slope"
    end
    
    def slope_till
      @bodyid = "state"
      @pagetitle = "Fields with 12% slope by tillage"
    end

    def tillage
      @bodyid = "state"
      @pagetitle = "Percentage of fields in tillage by crop"
    end

    def tolerable
      @bodyid = "state"
      @pagetitle = "Percetage of fields meeting 'T'"
    end

#    def remote_query
#      @partial_to_load = "state/partials/"+params[:partial_to_load]
#      
#      if params[:year].to_s.downcase == "all"
#        @formData = @calcYear
#      elsif params[:year].class == Array
#        @formData = params[:year]
#      else
#        @formData = params[:year].split(',').to_a
#      end
#      render :partial => @partial_to_load
#    end

def remote_query
  @partial_to_load = "state/partials/"+params[:query]

  render :partial => @partial_to_load
end

def scoped_query
  @partial_to_load = "state/partials/"+params[:partial_to_load]

  if params[:year].to_s.downcase == "all"
    @year = @calcYear
  else
    @year = params[:year].split(',').to_a
  end

  render :partial => @partial_to_load
end


private

  def get_counties
    @get_selectors = Transect.all(:select => "DISTINCT(transectCountyName)", :order => "transectCountyName ASC").map {|c| [c.transectCountyName]}
  end


end
