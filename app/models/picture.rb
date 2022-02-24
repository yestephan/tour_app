class Picture < ApplicationRecord
  belongs_to :tour, optional: true
end
