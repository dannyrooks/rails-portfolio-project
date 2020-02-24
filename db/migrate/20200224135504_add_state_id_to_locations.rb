class AddStateIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :state_id, :integer
  end
end
