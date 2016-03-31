class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  #for validity
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
		format: { with: VALID_EMAIL_REGEX }, #vaild
		uniqueness: {case_sensitive: false } #upcase unconcerned,unique
  #for unique
  has_secure_password #add password/password_confirmation column
  validates :password, length: { minimum: 6 }
end
