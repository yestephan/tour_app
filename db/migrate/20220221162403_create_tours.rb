class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :description
      t.string :location
      t.date :date
      t.decimal :price
      t.string :language
      t.time :start_time
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
