class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :from_stop_id
      t.integer :to_stop_id
      t.integer :min_transfer_time

      t.timestamps
    end
  end
end
