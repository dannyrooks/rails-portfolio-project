class Location < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports

    validates :name, :description, presence: true 
    validates :name, uniqueness: true

    accepts_nested_attributes_for :reports, reject_if: :all_blank

end
