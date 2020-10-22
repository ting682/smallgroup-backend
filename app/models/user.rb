class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :topics, dependent: :destroy
    has_many :passages, dependent: :destroy
    
    validates :email_address, presence: true, uniqueness: true


end
