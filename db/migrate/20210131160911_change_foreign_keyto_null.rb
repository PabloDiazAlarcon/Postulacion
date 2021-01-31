class ChangeForeignKeytoNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:venta, :movie_id, true)
    change_column_null(:venta, :tv_serie_id, true)
  end
end
