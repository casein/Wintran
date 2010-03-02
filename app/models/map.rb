class Map < ActiveRecord::Base
  belongs_to :route_stop
  has_many :seasons
  
    named_scope :active, :conditions => ['maps.pointActive = ?', 1]
    
    named_scope :coordinates, :conditions => ["xCoord > ? AND yCoord > ?", 0, 0]
end
