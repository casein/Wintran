class Point < ActiveRecord::Base
  belongs_to :route_stop
  has_many :seasons
  

end
