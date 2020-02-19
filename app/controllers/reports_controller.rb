class ReportsController < ApplicationController
  before_action :find_location
  before_action :find_report, only: [:edit, :update, :destroy]
      
    def index
      @reports = Report.all 
    end

    def new
      @report = current_user.report.build
    end

    def create
          @report = @location.reports.create(report_params)
          @report.user = current_user
          if @report.save
            redirect_to location_path(@location)
          else
            render 'new'
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
