class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, alow_blank: true
    validates :password_confirmation, presence: true, alow_blank: true
    
    
end
