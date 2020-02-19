class ReportsController < ApplicationController
  before_action :find_location
  before_action :find_report, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
      
    def index
      @reports = Report.all 
    end

    def new
      @report = current_user.reports.build
    end

    def create
      @report = current_user.reports.build(report_params)
      if @report.save
        redirect_to new_location_report_path
      else
        flash[:alert] = "Uh-Oh! Error creating report, try again!"
        redirect_to new_location_report_path(@location, @report)
      end
    end

    def edit
    end

    def update
      if @report.update(report_params)
        redirect_to location_path(@location)
      else
        render 'edit'
      end
    end

    def destroy
      @report.destroy
      redirect_to location_path(@location)
    end

    private

    def report_params
      params.require(:report).permit(:title, :content)
    end

    def find_location
      @location = Location.find(params[:location_id])
    end

    def find_report
      @report = @location.reports.find(params[:id])
    end

end
