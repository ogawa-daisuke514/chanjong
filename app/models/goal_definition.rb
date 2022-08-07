class GoalDefinition < ApplicationRecord
  has_many :roles
  belongs_to :role
  belongs_to :condition
end
