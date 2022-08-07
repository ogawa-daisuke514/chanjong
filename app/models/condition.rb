class Condition < ApplicationRecord
  belongs_to :condition
  has_many :roles
  has_many :piece_definitions
  has_many :goal_definitons
  has_many :conditions
end
