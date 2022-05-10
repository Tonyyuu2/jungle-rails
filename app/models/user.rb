class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3}
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)

    email = email.downcase.strip

    @user = User.find_by_email(email)

    if @user && @user.authenticate(password)
      @user
  end
end

end
