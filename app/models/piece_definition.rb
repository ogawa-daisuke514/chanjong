class PieceDefinition < ApplicationRecord
  belongs_to :piece_definition
  belongs_to :role
  belongs_to :condition
  has_many :piece_definitions
end
