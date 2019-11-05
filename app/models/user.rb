class User < ApplicationRecord
  attr_accessor :activation_token, :password_reset_token

  before_save :downcase_email

  before_create :create_activation_digest

  has_secure_password

  has_many :events
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def authenticated?(digest_type, token)
    digest = self.send(digest_type)
    BCrypt::Password.new(digest).is_password?(token)
  end

  def reset_password
    self.password_reset_token = self.class.new_token
    self.password_reset_digest = self.class.hash_token(password_reset_token)
    self.save
  end

  def send_reset_password_email
    UserMailer.password_reset_email(self).deliver_now
  end

  private

    # hashes the token
    def self.hash_token(token)
      BCrypt::Password.create(token)
    end

    # Returns a random token.
    def self.new_token
      SecureRandom.urlsafe_base64
    end

    def downcase_email
      self[:email].downcase!
    end

    def create_activation_digest
      self.activation_token = self.class.new_token
      self.activation_digest = self.class.hash_token(activation_token)
    end


end
