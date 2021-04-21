class User < ApplicationRecord

  has_many :notes

  validates :email, :name, :password, :password_confirmation, presence: true

  has_secure_password

end
