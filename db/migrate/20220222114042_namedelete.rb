class Namedelete < ActiveRecord::Migration[6.1]
  def change
    remove_column :tours, :name, :string
  end
end
