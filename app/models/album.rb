class Album < ActiveRecord::Base
	
	has_many :photos
	
	validates_presence_of :title, :description
	validates_uniqueness_of :title
end
