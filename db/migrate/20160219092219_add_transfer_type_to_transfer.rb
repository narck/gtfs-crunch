class AddTransferTypeToTransfer < ActiveRecord::Migration
  def change
    add_column :transfers, :transfer_type, :integer
  end
end
