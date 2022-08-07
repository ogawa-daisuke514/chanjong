class RoleOrder < ApplicationRecord
  belongs_to :higher_role, class_name: 'Role', foreign_key: 'higher_role_id'
  belongs_to :lower_role, class_name: 'Role', foreign_key: 'lower_role_id'
end
