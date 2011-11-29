class Waypoint < ActiveRecord::Base
	validates_presence_of :lat, :lng
	validates_numericality_of :lat, :lng

	belongs_to :geo_challenge
end
