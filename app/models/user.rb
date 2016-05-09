require 'bcrypt'

class User < ActiveRecord::Base
  has_valid_password

  has_many :entries

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end

