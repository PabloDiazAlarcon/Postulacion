class CreateVentaTvSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :venta_tv_series do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tv_serie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
