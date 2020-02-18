class RemoveDateFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :date, :datetime
  end
end
