class User < ActiveRecord::Base
  #Required by authlogic 
  acts_as_authentic

  belongs_to :role
  
  validates_uniqueness_of :username
  validates_presence_of :username, :email
  
end
