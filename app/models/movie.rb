class Movie < ApplicationRecord
  has_many :venta_movie, dependent: :destroy
  has_many :venta, dependent: :destroy
end
