class CreateGtfsSettings < ActiveRecord::Migration
  def change
    create_table :gtfs_settings do |t|
      t.string :latest_digest

      t.timestamps
    end
  end
end
