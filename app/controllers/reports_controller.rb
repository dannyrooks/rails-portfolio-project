class ReportsController < ApplicationController
  before_action :find_location
  before_action :find_report, only: [:edit, :update, :destroy]

    def user_reports
      @reports = current_user.songs
    end

    def index
      @reports = Report.all 
    end

    def new
    end

    def show
    end

    def create
      @location = Location.find(params[:location_id])
      @report = @location.reports.create(report_params)
      @report.user = current_user
      if @report.save
        redirect_to location_path(@location)
      else
        render 'new'
      end
    end

    def destroy
      @review.destroy
      redirect_to location_path(@location)
    end

    private

    def report_params
      params.require(:report).permit(:title, :date, :content)
    end

    def find_location
      @location = Location.find(params[location_id])
    end
end
