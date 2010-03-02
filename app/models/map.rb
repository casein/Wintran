class Map < ActiveRecord::Base
  belongs_to :route_stop
  has_many :seasons
  
    named_scope :active, :conditions => ['maps.pointActive = ?', 1]
    
    named_scope :byCounty, lambda { |county|
      {
        :joins => "INNER JOIN transects on maps.transect_id = transects.id", :conditions => ['transects.transectCountyName = ?', county]
      } }
      
      named_scope :byYear, lambda { |r2y| 
      { 
        :joins => "INNER JOIN seasons on maps.id = seasons.point_id", :conditions => ['seasons.seasonYear = ?', r2y] 
       } }
    
    named_scope :coordinates, :conditions => ["maps.pointXCoord > ? AND maps.pointYCoord > ?", 0, 0]
    
end
