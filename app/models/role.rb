class Role < ApplicationRecord
  belongs_to :user #, dependent: :destroy
  belongs_to :goal_definiton, optional: true
  belongs_to :condition, optional: true
  belongs_to :goal_example, optional: true
  has_many :higher_role_orders, class_name: 'RoleOrder', foreign_key: 'higher_role_id'
  has_many :lower_role_orders, class_name: 'RoleOrder', foreign_key: 'lower_role_id'
  has_many :piece_definitions
  has_many :goal_definitons
end
