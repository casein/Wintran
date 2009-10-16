class User < ActiveRecord::Base
  
  acts_as_authentic
  
  attr_accessible :username, :password, :password_confirmation, :email
  
  
end
