class Ventum < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :tv_serie, optional: true
end
