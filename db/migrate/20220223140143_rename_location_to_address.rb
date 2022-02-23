class RenameLocationToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :tours, :location, :address
  end
end
