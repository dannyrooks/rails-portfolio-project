class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def welcome
    end

    # def title
    #     @reports = Report.recent_report
    # end

    def name
        @locations = Location.order_by_name
    end
end


