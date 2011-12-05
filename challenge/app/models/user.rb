class User < ActiveRecord::Base
	validates :login, :presence => true, :uniqueness => true
	validates :password, :presence => true, :confirmation => true
	validates :password_confirmation, :presence => true
	validates :lat, :numericality => true, :allow_blank => true
	validates :lng, :numericality => true, :allow_blank => true

    acts_as_authentic
end
