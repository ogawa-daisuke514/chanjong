class GoalDefinition < ApplicationRecord
  has_many :roles
  belongs_to :role, optional: true
  belongs_to :condition
end
