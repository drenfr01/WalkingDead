class LocationChallenge < ActiveRecord::Base
  has_many :feats
  has_many :users, :through => :feats
  
  attr_accessible :title, :description, :latitude, :longitude
end
