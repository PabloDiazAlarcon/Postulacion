class User < ApplicationRecord
  has_many :venta, dependent: :destroy
end
