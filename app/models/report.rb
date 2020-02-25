class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location
    # has_many :comments

    validates :title, :content, presence: true
    validates :title, uniqueness: true

    scope :recent_reports, -> { order(created_at: :desc).limit(10) }

    
    
end
