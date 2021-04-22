class User < ApplicationRecord

  has_many :notes

  validates :email, :name, :password, :password_confirmation, presence: true

  has_secure_password

  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

end
