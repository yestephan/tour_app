class AddPictureToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :picture, :string
  end
end
