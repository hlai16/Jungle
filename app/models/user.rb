class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :password, length: {minimum: 8}
    validates :password_confirmation, length: {minimum: 8}
    validates_uniqueness_of :email
    before_create :lowercase_email
        def lowercase_email
            self.email = self.email.strip.downcase
        end
        def self.authenticate_with_credentials(email, password)
            user = User.find_by_email(email.strip.downcase)
            user && user.authenticate(password)
        end
end
