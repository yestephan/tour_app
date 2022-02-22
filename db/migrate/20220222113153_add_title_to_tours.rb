class AddTitleToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :name, :string
  end
end
