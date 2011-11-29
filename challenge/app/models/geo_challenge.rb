class GeoChallenge < ActiveRecord::Base
	validates_presence_of :user, :goal, :completed
	validates_associated :user, :goal

	belongs_to :user
	has_one :goal, :class_name => "Waypoint"
end
