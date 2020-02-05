class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :name, presence: true

    accepts_nested_attributes_for :location 
end
