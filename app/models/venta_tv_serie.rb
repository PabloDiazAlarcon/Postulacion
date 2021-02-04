class VentaTvSerie < ApplicationRecord
  belongs_to :user
  belongs_to :tv_serie, optional: true
end
