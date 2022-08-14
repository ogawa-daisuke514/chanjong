class PieceDefinition < ApplicationRecord
  belongs_to :piece_definition, optional: true
  belongs_to :role, optional: true
  belongs_to :condition, optional: true
  has_many :piece_definitions
end
