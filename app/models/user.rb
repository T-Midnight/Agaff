class User < ApplicationRecord
  has_secure_password

  extend Enumerize
  enumerize :role, in:[ :user, :admin ], default: :admin
end
