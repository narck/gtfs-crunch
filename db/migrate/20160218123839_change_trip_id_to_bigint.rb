class ChangeTripIdToBigint < ActiveRecord::Migration
  def change
    change_table :trips do |t|
      t.change :trip_id, :integer, :limit => 8
    end
  end
end
