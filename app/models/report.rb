class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :title, :date, presence: true

    # accepts_nested_attributes_for :location, regect_if: proc { |attr| attr[:name].blank? }
end
