class RouteStop < ActiveRecord::Base
  belongs_to :transect
  has_many :points
end
