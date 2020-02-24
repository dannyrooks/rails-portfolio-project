class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location
    # has_many :comments

    validates :title, :content, presence: true
    validates :title, uniqueness: true

    # scope :location_reported_most, -> { where(report) }
    scope :recent_report, -> { order(created_at: :desc) }

    
    
end
