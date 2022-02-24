class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
