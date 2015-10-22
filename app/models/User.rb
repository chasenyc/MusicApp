class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true
end
