class Admin < ApplicationRecord
    # attr_reader :email, :password
    has_secure_password

    validates_uniqueness_of :email
end
