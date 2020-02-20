class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :title, :content, presence: true
    validates :title, uniqueness: true

    scope :most_reports, -> 

end
