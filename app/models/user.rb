class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :request_friends, class_name: 'Friend', foreign_key: 'request_user_id'
  has_many :target_friends, class_name: 'Friend', foreign_key: 'target_user_id'
  has_many :roles
end
