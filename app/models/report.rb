class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :title, :content, presence: true
    validates :title, uniqueness: true

    # accepts_nested_attributes_for :location, reject_if: proc { |attr| attr[:name].blank? }
end
