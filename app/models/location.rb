class Location < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports
    belongs_to :state

    validates :name, :state_id, :description, presence: true 
    validates :name, uniqueness: true

    accepts_nested_attributes_for :reports, reject_if: :all_blank


    scope :order_by_name, -> { order("name ASC") }

end
