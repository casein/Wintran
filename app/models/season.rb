
  

class Season < ActiveRecord::Base
  belongs_to :point
  belongs_to :transect
  
  named_scope :active, :joins => "INNER JOIN points on points.id = seasons.point_id", :conditions => ['points.pointActive = ?', 1]

  named_scope :slp, :conditions => ['points.pointSlope = ?', 12]

  named_scope :tol, :conditions => ["points.pointTFactor >= seasons.seasonR2SingleYearSoilLoss"]

  named_scope :byTill, lambda { |tilTyp| 
    { 
      :conditions => ['seasonTillage = ?', tilTyp] 
      } }

  named_scope :byCrop, lambda { |cropTyp| 
    { 
      :conditions => ['seasonCrop = ?', cropTyp] 
      } }

  named_scope :byCounty, lambda { |county|
    {
      :joins => "INNER JOIN transects on transects.id = seasons.transect_id", :conditions => ['transects.transectCountyName = ?', county]
    } }

  named_scope :byWatershed, lambda { |watershed|
    {
      :conditions => ['points.pointWatershedName = ?', watershed]
    } }
  
  named_scope :byYear, lambda { |r2y| 
    { 
      :conditions => ['seasonYear = ?', r2y] 
      } } do
          
        def cropR2avg
            self.average(:seasonR2SingleYearSoilLoss, :conditions => "seasonr2SingleYearSoilLoss > -1.0", :group => 'seasonCrop')
        end
        
        def tilR2avg
            self.average(:seasonR2SingleYearSoilLoss, :conditions => "seasonr2SingleYearSoilLoss > -1.0", :group => 'seasonTillage')
        end
        
        def r2avg_slope
            self.average(:seasonR2SingleYearSoilLoss, :conditions => "seasonr2SingleYearSoilLoss > -1.0")
        end
        
        def tolerate

        end   
    end
  
end
