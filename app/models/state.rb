class State < ApplicationRecord
    has_many :locations
    belongs_to :location
    #should this be has_many_and_belongs_to?
end
