class User < ActiveRecord::Base 
  has_many :books , dependent: :destroy
  has_secure_password
  validates_presence_of :username, :email, :password
end
