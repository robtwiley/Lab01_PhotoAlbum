class User < ActiveRecord::Base
  #Required by authlogic 
  acts_as_authentic

  belongs_to :role
  
  validates_uniqueness_of :username
  validates_presence_of :username, :email
  
  #Used for declarative_authorization
  def role_symbols
    #Return an array of symbols of the role for a user but a user can only have one role 
	#on this site.
	#role.map do |role|
	  [role.name.underscore.to_sym]  #Converts and returns role as symbol for config\authorization_rules.rb
	#end
  end
  
end
