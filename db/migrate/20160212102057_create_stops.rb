class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.string :stop_lat
      t.string :stop_lon
      t.integer :zone_id
      t.string :stop_url
      t.integer :location_type
      t.integer :parent_station
      t.string :stop_timezone
      t.integer :wheelchair_boarding

      t.timestamps
    end
  end
end
