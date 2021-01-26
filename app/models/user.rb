# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_secure_password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, presence: { message: 'That username is already taken, please use another username.' }
  validates_uniqueness_of :email, presence: { message: 'That email is already associated to another account. Please use another email.' }
end
