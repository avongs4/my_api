class User < ApplicationRecord
    has_secure_password  # Enables password hashing and authentication
    validates :email, presence: true, uniqueness: true
  end
  