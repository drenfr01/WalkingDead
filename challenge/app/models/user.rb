class User < ActiveRecord::Base
	validates_presence_of :username
	validates_uniqueness_of :username

	has_many :geo_challenges
end
