class Report < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :comments

    validates :title, :content, presence: true
    validates :title, uniqueness: true

    scope :location_reported_most, -> { where(reports) }
    scope :order_by_date, -> { order(created_at: :desc) }

    def self.latest_report
        Report.where()
    end
end
