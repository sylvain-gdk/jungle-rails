class User < ActiveRecord::Base
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  has_secure_password

  def authenticate_with_credentials(param)
    self.authenticate(param)
  end

end
