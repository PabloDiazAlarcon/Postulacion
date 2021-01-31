class CreateTvSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_series do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.string :season

      t.timestamps
    end
  end
end
