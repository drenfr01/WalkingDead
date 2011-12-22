# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
#Landmark.delete_all
 challenge_id = 1;
 CSV.foreach("db/market_loc.csv") do |row|
   LocationChallenge.create(:challenge_id => challenge_id, :title => row[1], :description => "Farmer's Market: Eat local, eat fresh!", :longitude => row[5], :latitude => row[6])
   challenge_id = challenge_id + 1

  end