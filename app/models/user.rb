class User < ApplicationRecord
    has_secure_password

    has_many :topics, dependent: :destroy
    has_many :passages, dependent: :destroy
end
