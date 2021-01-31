class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.string :time

      t.timestamps
    end
  end
end
