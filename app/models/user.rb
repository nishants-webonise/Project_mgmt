class User < ActiveRecord::Base

  acts_as_authentic

  has_many :projects, :through => :user_has_projects

  attr_accessible :crypted_password, :email, :password_salt, :persistence_token, :username, :password, :password_confirmation
end
