class AddLocationIdtoStates < ActiveRecord::Migration[6.0]
  def change
    add_column :states, :location_id, :integer
  end
end
