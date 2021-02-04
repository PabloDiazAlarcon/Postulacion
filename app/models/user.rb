class User < ApplicationRecord
  has_many :venta, dependent: :destroy
  has_many :venta_movie, dependent: :destroy
  has_many :venta_tv_serie, dependent: :destroy
end
