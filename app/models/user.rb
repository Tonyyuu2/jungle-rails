class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3}
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def self.authenticate_with_credentials(email, password)
    if email == nil || password == nil
      nil
    else
      user_email = email.downcase.strip
      user = User.find_by_email(user_email)
      user && user.authenticate(password) ? user : nil
    end
  end

end
