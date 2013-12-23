class User < ActiveRecord::Base
	before_save { email.downcase! }
	validates :name,  presence: true, length: { maximum: 50 }

	# the next line is a reg ex that tests for email validity but allows multiple dots in the address
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# here is an improved reg ex that only allows a single dot in the address
	VAILD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
end
