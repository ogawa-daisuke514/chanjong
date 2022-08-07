class GoalExample < ApplicationRecord
  has_many :roles
  has_many :hand_tiles
  has_many :exposed_pieces
end
