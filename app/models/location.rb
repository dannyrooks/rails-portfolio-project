class Location < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports

    validates :name, :description, presence: true 
    validates :name, uniqueness: true
end
