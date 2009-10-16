class PagesController < ApplicationController
  
  before_filter :require_user
  
  def home
    @pagetitle = "Wintransect Home"
    @bodyid = "home"
    @menuid = "menu-home"
    @counties = Transect.all(:select => "DISTINCT(transectCountyName)").collect(&:transectCountyName).sort
  end
  
  def state
    @pagetitle = "Wintransect State"
    @bodyid = "state"
    @menuid = "menu-state"
  end

  def watershed
    @pagetitle = "Wintransect Watershed"
    @bodyid = "watershed"
    @menuid = "menu-watershed"
  end

  def county
    @pagetitle = "Wintransect County"
    @bodyid = "county"
    @menuid = "menu-county"
  end
  

end
