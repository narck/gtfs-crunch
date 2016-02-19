class ChangeTripIdToBigintForStopTimes < ActiveRecord::Migration
  def change
    change_table :stop_times do |t|
      t.change :trip_id, :integer, :limit => 8
    end
  end
end
