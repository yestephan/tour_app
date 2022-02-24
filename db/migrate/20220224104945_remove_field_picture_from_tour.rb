class RemoveFieldPictureFromTour < ActiveRecord::Migration[6.1]
  def change
    remove_column :tours, :picture, :string
  end
end
