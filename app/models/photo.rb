class Photo < ActiveRecord::Base
	
	belongs_to :album
	
	validates_presence_of :title, :location
	
end #end class Photo
