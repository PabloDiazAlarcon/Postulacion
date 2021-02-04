class TvSerie < ApplicationRecord
  has_many :venta_tv_serie, dependent: :destroy
  has_many :venta, dependent: :destroy
end
