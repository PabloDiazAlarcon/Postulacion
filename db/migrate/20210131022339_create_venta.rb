class CreateVenta < ActiveRecord::Migration[6.0]
  def change
    create_table :venta do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :tv_serie, null: false, foreign_key: true

      t.timestamps
    end
  end
end