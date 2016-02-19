class ChangeStopTimesToIntervals < ActiveRecord::Migration
  def change
    change_table :stop_times do |t|
      t.change :arrival_time, :interval
      t.change :departure_time, :interval
    end
  end
end
