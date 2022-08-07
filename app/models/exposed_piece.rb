class ExposedPiece < ApplicationRecord
  belongs_to :goal_example
  has_many :exposed_tiles
end
