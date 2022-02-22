class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :picture, :string
    add_column :users, :description, :text
  end
end
