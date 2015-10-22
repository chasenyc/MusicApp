class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  attr_reader :password #remember this being here but don't remember why.

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.is_password?(password)

    nil
  end

  def password=(password)
    @password = password #remember this being here but don't remember why.
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end


end
