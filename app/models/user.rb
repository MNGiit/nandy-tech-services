class User < ApplicationRecord
  has_secure_password # requires gem bcrypt
end
