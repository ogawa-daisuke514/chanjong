class Friend < ApplicationRecord
  belongs_to :request_user, class_name: 'User', foreign_key: 'request_user_id'
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'
end
