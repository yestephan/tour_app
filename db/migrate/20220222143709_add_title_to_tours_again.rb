class AddTitleToToursAgain < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :title, :string
  end
end
